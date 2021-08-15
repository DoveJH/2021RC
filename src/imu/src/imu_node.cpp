#include <ros/ros.h>
#include <tf/tf.h>
#include <sensor_msgs/Imu.h>
#include <std_msgs/Float64.h>
#define PI 3.14159265
ros::Publisher test;
ros::Publisher test2;
void four_num_mult(double w1, double x1, double y1, double z1, double w2, double x2, double y2, double z2, double& w3, double& x3, double& y3, double& z3)
{
    w3 = (w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2);
    x3 = (w1 * x2 + x1 * w2 + y1 * z2 - z1 * y2);
    y3 = (w1 * y2 + y1 * w2 + z1 * x2 - x1 * z2);
    z3 = (w1 * z2 + z1 * w2 + x1 * y2 - y1 * x2);
}
void imuCallback(const sensor_msgs::ImuConstPtr& msg)
{
    static int count = 0;
    static double adj_x = 0, adj_y = 0, adj_z = 0;
    double roll, pitch, yaw;
    tf::Quaternion q;
    tf::quaternionMsgToTF(msg->orientation, q);
    tf::Matrix3x3(q).getRPY(roll, pitch, yaw);
    //yaw -= adj_count * 0.0000184731288919;
    //ROS_INFO("roll%.12lf, pitch%.12lf, yaw%.12lf", roll / PI * 180, pitch / PI * 180, yaw/ PI * 180);
    msg->linear_acceleration;
    double linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world, linear_acceration_w;
    double linear_acceration_x_car, linear_acceration_y_car, linear_acceration_z_car;
    four_num_mult(msg->orientation.w, msg->orientation.x, msg->orientation.y, msg->orientation.z, 0, msg->linear_acceleration.x, msg->linear_acceleration.y, msg->linear_acceleration.z, linear_acceration_w, linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world);
    four_num_mult(linear_acceration_w, linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world, msg->orientation.w, 0 - msg->orientation.x, 0 - msg->orientation.y, 0 - msg->orientation.z, linear_acceration_w, linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world);
    //ROS_INFO("x:%.12lf, y:%.12lf, z:%.12lf",linear_acceration_x_world - 0.0028076428663798, linear_acceration_y_world - 0.0030384335564513, linear_acceration_z_world - 9.9174929536584677);
    linear_acceration_x_world -= 0.0028076428663798;
    linear_acceration_y_world -= 0.0030384335564513;
    linear_acceration_z_world -= 9.9174929536584677;
    if(linear_acceration_x_world < 0.031576408788 && linear_acceration_x_world > -0.029234894534)linear_acceration_x_world = 0;
    if(linear_acceration_y_world < 0.025060626917 && linear_acceration_y_world > -0.000350800818)linear_acceration_y_world = 0;
    if(linear_acceration_z_world < 0.033986401263 && linear_acceration_z_world > -0.023278846668)linear_acceration_z_world = 0;
    four_num_mult(msg->orientation.w, 0 - msg->orientation.x, 0 - msg->orientation.y, 0 - msg->orientation.z, 0, linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world, linear_acceration_w, linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world);
    four_num_mult(linear_acceration_w, linear_acceration_x_world, linear_acceration_y_world, linear_acceration_z_world, msg->orientation.w, msg->orientation.x, msg->orientation.y, msg->orientation.z, linear_acceration_w, linear_acceration_x_car, linear_acceration_y_car, linear_acceration_z_car);
    count ++;
    adj_x += msg->linear_acceleration.x;
    adj_y += msg->linear_acceleration.y;
    adj_z += msg->linear_acceleration.z;
    ROS_INFO("count:%d, x:%.16lf, y:%.16lf, z:%.16lf", count, adj_x, adj_y, adj_z);
    
    //下面计算时间间隔
    int duration = 0, now_nsec = 0;
    static int last_nsec = 0;
    static double last_linear_acceration_x;
    static double x;
    double now_linear_acceration_y;
    static bool flag = true;
    if(flag)
    {
        flag = false;
        last_nsec = msg->header.stamp.nsec;
        last_linear_acceration_x = linear_acceration_x_car;
    }
    else
    {
        now_nsec = msg->header.stamp.nsec;
        now_linear_acceration_x = linear_acceration_x_car;
        if(now_nsec > last_nsec)
        {
            duration = now_nsec - last_nsec;
        }
        else
        {
            duration = 1000000000 - last_nsec + now_nsec;
        }
        last_nsec = now_nsec;
        //x += (last_linear_acceration_x + now_linear_acceration_x) * 0.5 * duration / 1000000000;
        x += last_linear_acceration_x * duration / 1000000000;
        last_linear_acceration_x = now_linear_acceration_x;
    }
    ROS_INFO("%.12f", x);

    std_msgs::Float64 testMsg;
    testMsg.data = msg->orientation.x;
    test.publish(testMsg);
    //testMsg.data = linear_acceration_x_car;
    //test2.publish(testMsg);
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "imu_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/imu/data", 1, &imuCallback);
    test = n.advertise<std_msgs::Float64>("/test", 1);
    test2 = n.advertise<std_msgs::Float64>("/test2", 1);
    ros::spin();
}