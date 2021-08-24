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
#define USE_FP32  // set USE_INT8 or USE_FP16 or USE_FP32
#define DEVICE 0  // GPU id
#define PI 3.14159265
float NMS_THRESH = 0.4;
float CONF_THRESH = 0.7;

// stuff we know about the network and the input/output blobs
static const int INPUT_H = Yolo::INPUT_H;
static const int INPUT_W = Yolo::INPUT_W;
static const int CLASS_NUM = Yolo::CLASS_NUM;
static const int OUTPUT_SIZE = Yolo::MAX_OUTPUT_BBOX_COUNT * sizeof(Yolo::Detection) / sizeof(float) + 1;  // we assume the yololayer outputs no more than MAX_OUTPUT_BBOX_COUNT boxes that conf >= 0.1
const char* INPUT_BLOB_NAME = "data";
const char* OUTPUT_BLOB_NAME = "prob";
double yaw, pitch, roll;
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
int k_volleyball = 0;
int k_basketball = 0;
int k_basket = 0;
int k_mark = 0;
int k_home = 0;
enum target
{
    volleyball = 0, basketball, basket, mark, home
};
target aim = volleyball;
bool if_show = true;
class result_deal
{
public:
    cv::Rect bbox;
    float conf;
    int class_id;
    int score;
    int distance;
    double yaw;
    double pitch;
    double roll;
    result_deal(cv::Rect re = cv::Rect(0, 0, 0, 0), double r = 0, double p = 0, double y = 0)
    {
        bbox = re;
        getDistance();
        //getScore();
        roll = r;
        yaw = y;
        pitch = p;
        ROS_INFO("roll%.12lf, pitch%.12lf, yaw%.12lf", roll / PI * 180, pitch / PI * 180, yaw/ PI * 180);
   }
    void getDistance()
    {
        int k = 0;
        if(class_id == 0 || class_id == 1)k = k_volleyball;
        else if(class_id == 2 || class_id == 3)k = k_basketball;
        else if(class_id == 4)distance = exchange_distance;
        else if(class_id == 5)k = k_mark;
        else if(class_id == 6)k = k_home;
        distance = 100;
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
                score = 10 / distance;
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
                score = 10 / distance;
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
                score = 10;
            }
        }
        if(aim == mark)
        {
            if(class_id == 0 || class_id == 1 || class_id == 2 ||class_id == 3 ||class_id == 6 || class_id == 4)
            {
                score = 0;
            }
            else
            {
                score = 10;
            }
        }
        if(aim == home)
        {
             if(class_id == 0 || class_id == 1 || class_id == 2 ||class_id == 3 ||class_id == 5 || class_id == 4)
            {
                score = 0;
            }
            //else if(yaw)
            else
            {
                score = 10;
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
    k_basket = msg->k_basket;
    k_basketball = msg->k_basketball;
    k_volleyball = msg->k_volleyball;
    k_mark = msg->k_mark;
    if_show = msg->if_show;
}
void modeCallback(const std_msgs::UInt8::ConstPtr& msg)
{
    aim = (target)msg->data;
    ROS_INFO("%d", aim);
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
    doInference(*context, stream, buffers, data, prob, 1);
    std::vector<Yolo::Detection> batch_res;
    std::vector<result_deal> pass_result;
    nms(batch_res, &prob[0], CONF_THRESH, NMS_THRESH);
    ros::param::get("/yaw", yaw);
    ros::param::get("/pitch", pitch);
    ros::param::get("/roll", roll);
    for (int b = 0; b < batch_res.size(); b++)
    {
        cv::Rect r = get_rect(img, batch_res[b].bbox);
        result_deal rd(r, roll, pitch, yaw);
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
    if(if_show)
    {
        for (int b = 0; b < batch_res.size(); b++) 
        {
            //auto& res = batch_res[b];
            for (size_t j = 0; j < batch_res.size(); j++) 
            {
                cv::Rect r = get_rect(img, batch_res[j].bbox);
                cv::rectangle(img, r, cv::Scalar(0x27, 0xC1, 0x36), 2);
                cv::putText(img, std::to_string((int)batch_res[j].class_id + 1), cv::Point(r.x, r.y - 1), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
                cv::putText(img, std::to_string(batch_res[j].conf), cvPoint(r.x, r.y - 15), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
            }
        }
        sensor_msgs::ImagePtr detectingResult = cv_bridge::CvImage(std_msgs::Header(), "bgr8", img).toImageMsg();
        detectingPub.publish(detectingResult);
    }
}