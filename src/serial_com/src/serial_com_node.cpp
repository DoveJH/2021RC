#include <ros/ros.h>
#include <serial/serial.h>
#include <std_msgs/UInt8.h>
#include <yolov5/result.h>
//#include <yolov5/result.h>
serial::Serial sp;
void resultCallback(const yolov5::resultConstPtr& msg)
{
    uint8_t send[4];
   send[1] = (uint8_t)msg->x;
    send[0] = (uint8_t)((msg->x) >> 8);
    send[3] = (uint8_t)msg->distance;
    send[2] = (uint8_t)((msg->distance) >> 8);
    sp.write(send, 4);
}
int main(int argc, char** argv)
{
    ros::init(argc, argv, "serial_com_node");
    ros::NodeHandle n;
    ros::Publisher modePub = n.advertise<std_msgs::UInt8>("/mode", 1);
    ros::Subscriber resultSub = n.subscribe("/target",1, &resultCallback);
    std_msgs::UInt8 modeMsg;
    uint8_t receive[5];
    uint8_t last_receive[5];
   
    last_receive[0] = 255;
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
            n = sp.read(receive, n);
            int a = receive[0];
            ROS_INFO("%d", a);
            if(last_receive[0] != receive[0])
            {
                modeMsg.data = receive[0];
                modePub.publish(modeMsg);
                last_receive[0] = receive[0];
            }
        }
        ros::spinOnce();
        loop_rate.sleep();
    }
    sp.close();
    return 0;
}