#include<iostream>
using namespace std;

#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <sstream>
#include <iostream>
#include "opencv2/opencv.hpp"
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include "MVCamera.h"
#include <std_msgs/Bool.h>
#include <std_msgs/Int16.h>
//#include <config/RC2021Config.h>
using namespace std;
using namespace cv;
MVCamera *mv_driver=NULL;
Size dist_size=Size(640,512);
class MVCamNode
{
public:
    ros::NodeHandle node_;
    int false_idx=0;
    // shared image message
    Mat rawImg;
    sensor_msgs::ImagePtr msg;
    image_transport::Publisher image_pub_;
    int image_width_, image_height_, framerate_, fps_mode=1, exposure = 30000;
    
    bool large_resolution_=false, autoexposure_=false;
    MVCamNode():
        node_("~")
    {
        node_.getParam("/exposure", exposure);
        node_.getParam("/autoexposure", autoexposure_);
        image_transport::ImageTransport it(node_);
        image_pub_ = it.advertise("/MVCamera/image_raw", 1);
        node_.param("image_width", image_width_, 640);
        node_.param("image_height", image_height_, 512);
        node_.param("framerate", framerate_, 250);
        //init camera param
        mv_driver=new MVCamera;
        mv_driver->Init();
        mv_driver->SetExposureTime(autoexposure_, exposure);
        mv_driver->SetLargeResolution(large_resolution_);
        mv_driver->Set_fps(fps_mode);
        mv_driver->Play();
    }
    ~MVCamNode()
    {
        mv_driver->Stop();
        mv_driver->Uninit();
    }
    bool take_and_send_image()
    {
        // grab the image
        mv_driver->GetFrame_B(rawImg,1);
        if(rawImg.empty())
        {
            ROS_WARN("NO IMG GOT FROM MV");
            return false;
        }
        if(large_resolution_)
            resize(rawImg,rawImg,dist_size);
        msg= cv_bridge::CvImage(std_msgs::Header(), "bgr8", rawImg).toImageMsg();
        // publish the image
        image_pub_.publish(msg);
        return true;
    }
    bool spin()
    {
        ros::Rate loop_rate(this->framerate_);
        while (node_.ok())
        {
            if (!mv_driver->stopped) {
                if (!take_and_send_image()) ROS_WARN("MVcamera did not respond in time.");
            }
            ros::spinOnce();
            loop_rate.sleep();
        }
        return true;
    }
};

int main(int argc, char **argv)
{
    ros::init(argc,argv,"MVcamera_node");
    MVCamNode mv_node;
    mv_node.spin();
    return EXIT_SUCCESS;
}
