#include <cmath>
#include <cv_bridge/cv_bridge.h>
#include <ros/ros.h>
#include "cuda_utils.h"
#include "logging.h"
#include "common.hpp"
#include "utils.h"
#include <opencv2/opencv.hpp>
#include <sensor_msgs/Image.h>
#include <config/param.h>
#include <sensor_msgs/Imu.h>
#include <std_msgs/UInt8.h>
#include <tf/tf.h>
#include <yolov5/result.h>
using namespace cv;
#define USE_FP16 // set USE_INT8 or USE_FP16 or USE_FP32
#define DEVICE 0  // GPU id
#define PI 3.14159265
float NMS_THRESH = 0.4;
float CONF_THRESH = 0.5;

// stuff we know about the network and the input/output blobs
static const int INPUT_H = Yolo::INPUT_H;
static const int INPUT_W = Yolo::INPUT_W;
static const int CLASS_NUM = Yolo::CLASS_NUM;
static const int OUTPUT_SIZE = Yolo::MAX_OUTPUT_BBOX_COUNT * sizeof(Yolo::Detection) / sizeof(float) + 1;  // we assume the yololayer outputs no more than MAX_OUTPUT_BBOX_COUNT boxes that conf >= 0.1
const char* INPUT_BLOB_NAME = "data";
const char* OUTPUT_BLOB_NAME = "prob";
int yaw, pitch, roll;
static Logger gLogger;
ros::Publisher detectingPub;
ros::Publisher resultPub;
void imageCallback(const sensor_msgs::ImageConstPtr& msg);
void* buffers[2];
static float data[3 * INPUT_H * INPUT_W];
static float prob[ OUTPUT_SIZE];
int exchange_distance;
cudaStream_t stream;
IExecutionContext* context;
double cameraDistance = 450;
enum target
{
    volleyball = 0, basketball, basket, mark, home
};
target aim = (target)0;
bool if_show = true;
class result_deal
{
public:
    cv::Rect bbox;
    float conf;
    int class_id;
    int score;
    int distance;
    int center_x;
    int center_y;
    int yaw;
    //double pitch;
    //double roll;
    
    result_deal(cv::Rect re = cv::Rect(0, 0, 0, 0), int id = 100, int y = 0)
    {
        class_id = id;
        bbox = re;
        center_x = (int)(bbox.x + 0.5 * bbox.width);
        center_y = (int)(bbox.y + 0.5 * bbox.height);
        getDistance();
        getScore();
        yaw = y;
        //ROS_INFO("roll%.12lf, pitch%.12lf, yaw%.12lf", roll / PI * 180, pitch / PI * 180, yaw/ PI * 180);
   }
    void getDistance()
    {
        double k = 20;
        int size;
        if(class_id == 5)
        {
            if(bbox.x <= 5 || (bbox.x + bbox.width) >= 635)
            {
                size = bbox.height;
                k = 100;
            }
            else if(bbox.y <= 5 || (bbox.y + bbox.height) >= 507)
            {
                size = bbox.width;
                k = 20;
            }
            else
            {
                size = bbox.width;
                k = 20;
            }
        }
        else if(bbox.x <= 5 || (bbox.x + bbox.width) >= 635)
        {
            size = bbox.height;
        }
        else if(bbox.y <= 5 || (bbox.y + bbox.height) >= 507)
        {
            size = bbox.width;
        }
        else
        {
            size = bbox.width;
        }
        if(class_id == 0 || class_id == 1)k = 21.0084524;
        else if(class_id == 2 || class_id == 3)k = 24.6;
        else if(class_id == 4)distance = exchange_distance;
        else if(class_id == 6)k = 100;
        distance = sqrt(k * k * ((center_x - 320) * (center_x - 320) + (center_y - 256) * (center_y - 256) + cameraDistance * cameraDistance) / (size * size));
        if(class_id == 4)
        {
            distance = exchange_distance;
        }
        if(class_id == 5)
        {
            exchange_distance = distance;
        }
        if((bbox.x <= 5 || (bbox.x + bbox.width) >= 635) && (bbox.y <= 5 || (bbox.y + bbox.height) >= 507))
        {
            distance = 10000;
        }
        if(class_id == 6)
        {
            distance = 10;
        }
        //ROS_INFO("%d, %d", bbox.x + bbox.width, bbox.y + bbox.height);
    }
   
    void getScore()
    {
        if(aim == volleyball)
        {
            if(class_id == 2 || class_id == 3 || class_id == 4 ||class_id == 5 ||class_id == 6)
            {
                score = 0;
            }
            else
            {
                score = 1000 / distance;
            }
        }
        if(aim == basketball)
        {
            if(class_id == 0 || class_id == 1 || class_id == 4 ||class_id == 5 ||class_id == 6)
            {
                score = 0;
            }
            else
            {
                score = 1000 / distance;
            }
        }
        if(aim == basket)
        {
            if(class_id == 0 || class_id == 1 || class_id == 2 ||class_id == 3 ||class_id == 6 || class_id == 5)
            {
                score = 0;
            }
            else
            {
                score = 1000;
            }
        }
        if(aim == mark)
        {
            if(class_id == 0 || class_id == 1 || class_id == 2 ||class_id == 3 ||class_id == 6 || class_id == 4 || abs(yaw) < 60)
            {
                score = 0;
            }
            else
            {
                score = 1000;
            }
        }
        if(aim == home)
        {
             if(class_id == 0 || class_id == 1 || class_id == 2 ||class_id == 3 ||class_id == 5 || class_id == 4 || abs(yaw) < 60)
            {
                score = 0;
            }
            //else if(yaw)
            else
            {
                score = 1000;
            }
        }
    }
   
};
void doInference(IExecutionContext& context, cudaStream_t& stream, void **buffers, float* input, float* output, int batchSize) {
    // DMA input batch data to device, infer on the batch asynchronously, and DMA output back to host
    CUDA_CHECK(cudaMemcpyAsync(buffers[0], input, batchSize * 3 * INPUT_H * INPUT_W * sizeof(float), cudaMemcpyHostToDevice, stream));
    context.enqueue(batchSize, buffers, stream, nullptr);
    CUDA_CHECK(cudaMemcpyAsync(output, buffers[1], batchSize * OUTPUT_SIZE * sizeof(float), cudaMemcpyDeviceToHost, stream));
    cudaStreamSynchronize(stream);
}
void paramCallback(const config::param::ConstPtr& msg)
{
    NMS_THRESH = msg->NMS_THRESH;
    CONF_THRESH = msg->CONF_THRESH;
    if_show = msg->if_show;
}
void modeCallback(const std_msgs::UInt8::ConstPtr& msg)
{
    aim = (target)msg->data;
    ROS_INFO("%d", aim);
}
void drawapp(Mat result, Mat img2)
{
	for (int i = 0; i < result.rows; i++)
	{
		//最后一个坐标点与第一个坐标点连接
		if (i == result.rows - 1)
		{
			Vec2i point1 = result.at<Vec2i>(i);
			Vec2i point2 = result.at<Vec2i>(0);
			line(img2, point1, point2, Scalar(0, 0, 255), 2, 8, 0);
			break;
		}
		Vec2i point1 = result.at<Vec2i>(i);
		Vec2i point2 = result.at<Vec2i>(i + 1);
		line(img2, point1, point2, Scalar(0, 0, 255), 2, 8, 0);
	}
}
void findSquares(Mat& img, std::vector<Yolo::Detection> br )
{
    Mat canny;
	Canny(img, canny, 80, 160, 3, false);
	//膨胀运算
	Mat kernel = getStructuringElement(0, Size(3, 3));
	dilate(canny, canny, kernel);

	// 轮廓发现与绘制
	std::vector<std::vector<Point>> contours;
	std::vector<Vec4i> hierarchy;
	findContours(canny, contours, hierarchy, 0, 2, Point());
    int t;
	//绘制多边形
	for (t = 0; t < contours.size(); t++)
	{
        if(contourArea(contours[t]) < 10000)continue;
		//用最小外接矩形求取轮廓中心
		RotatedRect rrect = minAreaRect(contours[t]);
		Point2f center = rrect.center;
		circle(img, center, 2, Scalar(0, 255, 0), 2, 8, 0);

		Mat result;
		approxPolyDP(contours[t], result, 4, true);  //多边形拟合
		drawapp(result, img);
		//判断形状和绘制轮廓
		if (result.rows == 4)
		{
			//putText(img, "rectangle", center, 0, 1, Scalar(0, 255, 0), 1, 8);
            int dis1, dis2, dis3, dis4;
            double d1, d2;
            dis1 = (result.at<Vec2i>(0)[0] - result.at<Vec2i>(1)[0]) * (result.at<Vec2i>(0)[0] - result.at<Vec2i>(1)[0]) + (result.at<Vec2i>(0)[1] - result.at<Vec2i>(1)[1]) * (result.at<Vec2i>(0)[1] - result.at<Vec2i>(1)[1]);
            dis2 = (result.at<Vec2i>(1)[0] - result.at<Vec2i>(2)[0]) * (result.at<Vec2i>(1)[0] - result.at<Vec2i>(2)[0]) + (result.at<Vec2i>(1)[1] - result.at<Vec2i>(2)[1]) * (result.at<Vec2i>(1)[1] - result.at<Vec2i>(2)[1]);
            dis3 = (result.at<Vec2i>(2)[0] - result.at<Vec2i>(3)[0]) * (result.at<Vec2i>(2)[0] - result.at<Vec2i>(3)[0]) + (result.at<Vec2i>(2)[1] - result.at<Vec2i>(3)[1]) * (result.at<Vec2i>(2)[1] - result.at<Vec2i>(3)[1]);
            dis4 = (result.at<Vec2i>(3)[0] - result.at<Vec2i>(0)[0]) * (result.at<Vec2i>(3)[0] - result.at<Vec2i>(0)[0]) + (result.at<Vec2i>(3)[1] - result.at<Vec2i>(0)[1]) * (result.at<Vec2i>(3)[1] - result.at<Vec2i>(0)[1]);
            d1 = sqrt(dis1+dis3);
            d2 = sqrt(dis2+dis4);
            float a = d1 / (d1 + d2);
            if(a > 0.3 && a < 0.7)
            {
                Yolo::Detection yd;
                yd.bbox[0] = center.x;
                yd.bbox[1] = center.y;
                yd.bbox[2] = 10;
                yd.bbox[3] = 10;
                yd.conf = 1;
                yd.class_id = 6;
            }
            //ROS_INFO("%lf %lf",d1, d2 );
		}
	}
}
int main(int argc, char** argv)
{
    cudaSetDevice(DEVICE);
    ros::init(argc, argv, "yolov5_node");
    ros::start();
    ros::NodeHandle n;
    // create a model using the API directly and serialize it to a stream
    char *trtModelStream = nullptr;
    size_t size = 0;
    std::string engine_name;
    engine_name ="/home/dovejh/project/RC/RC2021/src/config/engine/yolov5s.engine";
    n.getParam("/engine_name", engine_name);
    std::ifstream file(engine_name, std::ios::binary);
    if(file.good())
    {
        file.seekg(0, file.end);
        size = file.tellg();
        file.seekg(0, file.beg);
        trtModelStream = new char[size];
        assert(trtModelStream);
        file.read(trtModelStream, size);
        file.close();
    }
    // prepare input data ---------------------------
    IRuntime* runtime = createInferRuntime(gLogger);
    assert(runtime != nullptr);
    ICudaEngine* engine = runtime->deserializeCudaEngine(trtModelStream, size);
    assert(engine != nullptr);
    context = engine->createExecutionContext();
    assert(context != nullptr);
    delete[] trtModelStream;
    assert(engine->getNbBindings() == 2);
    // In order to bind the buffers, we need to know the names of the input and output tensors.
    // Note that indices are guaranteed to be less than IEngine::getNbBindings()
    const int inputIndex = engine->getBindingIndex(INPUT_BLOB_NAME);
    const int outputIndex = engine->getBindingIndex(OUTPUT_BLOB_NAME);
    assert(inputIndex == 0);
    assert(outputIndex == 1);
    // Create GPU buffers on device
    CUDA_CHECK(cudaMalloc(&buffers[inputIndex], 3 * INPUT_H * INPUT_W * sizeof(float)));
    CUDA_CHECK(cudaMalloc(&buffers[outputIndex], OUTPUT_SIZE * sizeof(float)));
    // Create stream
    cudaStream_t stream;
    CUDA_CHECK(cudaStreamCreate(&stream));
    ROS_WARN("engine init done!");
    ros::Subscriber imageSub = n.subscribe("/MVCamera/image_raw", 1, &imageCallback);
    ros::Subscriber paramSub = n.subscribe("/param", 1, &paramCallback);
    ros::Subscriber modeSub = n.subscribe("/mode", 1, &modeCallback);
    detectingPub = n.advertise<sensor_msgs::Image>("/detectingResult", 1);
   resultPub = n.advertise<yolov5::result>("/target", 1);
    ros::spin();

    // Release stream and buffers
    cudaStreamDestroy(stream);
    CUDA_CHECK(cudaFree(buffers[inputIndex]));
    CUDA_CHECK(cudaFree(buffers[outputIndex]));
    // Destroy the engine
    context->destroy();
    engine->destroy();
    runtime->destroy();
    return 0;
}
void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
    cv::Mat img = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8)->image;
    if (!img.empty())
    {
        cv::Mat pr_img = preprocess_img(img,  INPUT_W, INPUT_H);
        int i = 0;
        for (int row = 0; row < INPUT_H; ++row) {
            uchar* uc_pixel = pr_img.data + row * pr_img.step;
            for (int col = 0; col < INPUT_W; ++col) {
                data[i] = (float)uc_pixel[2] / 255.0;
                data[i + INPUT_H * INPUT_W] = (float)uc_pixel[1] / 255.0;
                data[i + 2 * INPUT_H * INPUT_W] = (float)uc_pixel[0] / 255.0;
                uc_pixel += 3;
                ++i;
            }
        }
    }
    // Run inference
    std::vector<result_deal> pass_result;
    std::vector<Yolo::Detection> batch_res;
    if(aim != 4)
    {
        doInference(*context, stream, buffers, data, prob, 1);
        nms(batch_res, &prob[0], CONF_THRESH, NMS_THRESH);
    }
    else
    {
        Mat img_gray;
        cv::cvtColor(img, img_gray, cv::COLOR_BGR2GRAY);
        findSquares(img_gray, batch_res);
    }
    //ros::param::get("/yaw", yaw);
    for (int b = 0; b < batch_res.size(); b++)
    {
        cv::Rect r = get_rect(img, batch_res[b].bbox);
        result_deal rd(r, batch_res[b].class_id, yaw);
        cv::putText(img, std::to_string(rd.distance), cvPoint(r.x, r.y - 29), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
        if(pass_result.empty())
        {
            pass_result.push_back(rd);
        }
        else if(rd.score >= pass_result[0].score)
        {
            pass_result.insert(pass_result.begin() + 1, rd);
        }
        else 
        {
            pass_result.push_back(rd);
        }
    }
    if(pass_result.empty() || pass_result[0].score == 0)
    {
        yolov5::result msg;
        msg.x = 0xFF;
        msg.y = 0xFF;
        msg.distance = 0xFF;
        msg.direction = 0xFF;
        //ROS_INFO("%lf",pass_result[0].yaw );
        resultPub.publish(msg);
    }
    if(!pass_result.empty() && pass_result[0].score != 0)
    {
        yolov5::result msg;
        msg.x = pass_result[0].center_x;
        msg.y = pass_result[0].center_y;
        msg.distance = pass_result[0].distance;
        msg.direction = pass_result[0].yaw;
        //ROS_INFO("%lf",pass_result[0].yaw );
        resultPub.publish(msg);
    }
    pass_result.clear();
    if(if_show)
    {
        for (int b = 0; b < batch_res.size(); b++) 
        {
            //auto& res = batch_res[b];
            for (size_t j = 0; j < batch_res.size(); j++) 
            {
                cv::Rect r = get_rect(img, batch_res[j].bbox);
                cv::rectangle(img, r, cv::Scalar(0x27, 0xC1, 0x36), 2);
                cv::putText(img, std::to_string((int)batch_res[j].class_id), cv::Point(r.x, r.y - 1), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
                cv::putText(img, std::to_string(batch_res[j].conf), cvPoint(r.x, r.y - 15), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
            }
        }
        sensor_msgs::ImagePtr detectingResult = cv_bridge::CvImage(std_msgs::Header(), "bgr8", img).toImageMsg();
        detectingPub.publish(detectingResult);
    }
}
