#include <cmath>
#include <cv_bridge/cv_bridge.h>
#include <ros/ros.h>
#include "cuda_utils.h"
#include "logging.h"
#include "common.hpp"
#include "utils.h"
#include <opencv2/opencv.hpp>
#include <sensor_msgs/Image.h>

#define USE_FP32  // set USE_INT8 or USE_FP16 or USE_FP32
#define DEVICE 0  // GPU id
#define NMS_THRESH 0.4
#define CONF_THRESH 0.25

// stuff we know about the network and the input/output blobs
static const int INPUT_H = Yolo::INPUT_H;
static const int INPUT_W = Yolo::INPUT_W;
static const int CLASS_NUM = Yolo::CLASS_NUM;
static const int OUTPUT_SIZE = Yolo::MAX_OUTPUT_BBOX_COUNT * sizeof(Yolo::Detection) / sizeof(float) + 1;  // we assume the yololayer outputs no more than MAX_OUTPUT_BBOX_COUNT boxes that conf >= 0.1
const char* INPUT_BLOB_NAME = "data";
const char* OUTPUT_BLOB_NAME = "prob";
static Logger gLogger;
ros::Publisher detectingPub;
ros::Publisher resultPub;
void imageCallback(const sensor_msgs::ImageConstPtr& msg);
void* buffers[2];
static float data[3 * INPUT_H * INPUT_W];
static float prob[ OUTPUT_SIZE];
cudaStream_t stream;
IExecutionContext* context;

void doInference(IExecutionContext& context, cudaStream_t& stream, void **buffers, float* input, float* output, int batchSize) {
    // DMA input batch data to device, infer on the batch asynchronously, and DMA output back to host
    CUDA_CHECK(cudaMemcpyAsync(buffers[0], input, batchSize * 3 * INPUT_H * INPUT_W * sizeof(float), cudaMemcpyHostToDevice, stream));
    context.enqueue(batchSize, buffers, stream, nullptr);
    CUDA_CHECK(cudaMemcpyAsync(output, buffers[1], batchSize * OUTPUT_SIZE * sizeof(float), cudaMemcpyDeviceToHost, stream));
    cudaStreamSynchronize(stream);
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
    //n.getParam("/engine_name", engine_name);
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
    detectingPub = n.advertise<sensor_msgs::Image>("/detectingResult", 1);
    ros::Rate loop_rate(100);
    while(ros::ok())
    {
        ros::spinOnce();
		loop_rate.sleep();
    }

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
    nms(batch_res, &prob[0], CONF_THRESH, NMS_THRESH);
    for (int b = 0; b < batch_res.size(); b++) 
    {
        auto& res = batch_res[b];
        for (size_t j = 0; j < batch_res.size(); j++) 
        {
            cv::Rect r = get_rect(img, batch_res[j].bbox);
            cv::rectangle(img, r, cv::Scalar(0x27, 0xC1, 0x36), 2);
            cv::putText(img, std::to_string((int)batch_res[j].class_id + 1), cv::Point(r.x, r.y - 1), cv::FONT_HERSHEY_PLAIN, 1.2, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
        }
    }
    sensor_msgs::ImagePtr detectingResult = cv_bridge::CvImage(std_msgs::Header(), "bgr8", img).toImageMsg();
    detectingPub.publish(detectingResult);
}