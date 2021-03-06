#include <ros/ros.h>
#include <serial/serial.h>
//#include <yolov5/result.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "serial_com_node");
    ros::NodeHandle n;
    serial::Serial sp;
    serial::Timeout to = serial::Timeout::simpleTimeout(1000);
    sp.setPort("/dev/ttyUSB1");
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
        ROS_WARN("/dev/ttyUSB1 is opened");
    }
    else 
    {
        return -1;
    }
    ros::Rate loop_rate(500);
    while(ros::ok())
    {
        size_t n = sp.available();
        if(n != 0)
        {
            uint8_t buffer[1024];
            n = sp.read(buffer, n);
            ROS_INFO_STREAM( buffer);
            sp.write(buffer, n);
        }
        loop_rate.sleep();
    }
    sp.close();
    return 0;
}