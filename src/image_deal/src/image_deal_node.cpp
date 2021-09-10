#include <ros/ros.h>
#include <yolov5/result.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <config/param.h>
char ad[100] = { 0 };
bool if_shot = false;
void imageDealCallback(const sensor_msgs::ImageConstPtr& msg)
{
    if (if_shot)
    {
        cv::Mat img = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8)->image;
        static int d = 9999;
        cv::imshow("shot", img);
        int k = cv::waitKey(30);
        if(k == 's' && !img.empty())
        {
            sprintf(ad, "/home/dovejh/project/RC/train/images/%d.jpg", d++);
            cv::imwrite(ad, img);
            ROS_INFO("Get %d pictures!", d);
        }
    }
}
void paramCallback(const config::param::ConstPtr& msg)
{
    if_shot = msg->if_shot;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "image_deal_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/MVCamera/image_raw", 1, &imageDealCallback);
    ros::Subscriber paramSub = n.subscribe("/param", 1, &paramCallback);
    ros::spin();
}
