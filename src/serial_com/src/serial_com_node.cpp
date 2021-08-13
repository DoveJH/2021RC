#include <ros/ros.h>
#include <serial/serial.h>
#include <yolov5/result.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "serial_com_node");
    ros::NodeHandle n;
    serial::Serial sp;
    serial::Timeout to = serial::Timeout::simpleTimeout(1000);
    sp.setPort("dev/ttyUSB0");
    sp.setBaudrate(115200);
    sp.setTimeout(to);
    try
    {
        sp.open();
    }
    catch(serial::IOException& e)
    {
        ROS_ERROR_STREAM("Unable to open port");
        return -1;
    }
    if(sp.isOpen())
    {
        ROS_WARN("/dev/ttyUSB0 is opened");
    }
    else 
    {
        return -1;
    }
    ros::Rate loop_rate(500);
    while(ros::ok())
    {

    }
}