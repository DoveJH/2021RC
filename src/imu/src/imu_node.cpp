#include <ros/ros.h>
#include <tf/tf.h>
#include <sensor_msgs/Imu.h>
#include <std_msgs/Float64.h>
#include <math.h>
#include <config/param.h>
#define PI 3.14159265
ros::Publisher testx;
ros::Publisher testy;
ros::Publisher testz;
double k_x0 = 0.4, k_y0 = 0.4, k_z0 = 0.4,  k_x1, k_y1, k_z1, k_test = 0.5;
double roll, pitch, yaw;
class velocity_controller
{
private:
public:
    double linear_acceleration_raw[100];
    int count;
    double error;
    double variance;
    double average;
    bool is_moving;
    bool last_is_moving;
    velocity_controller()
    {
        //linear_acceleration_raw[0] = 0;
        count = 0;
        error = 0;
        variance = 0;
        average = 0;
        is_moving = false;
        last_is_moving = false;
    }
    void updateVariance()
    {
        for(int i = 0; i < count; i++)
        {
            average += linear_acceleration_raw[i];
        }
        average /= count;
        for(int i = 0; i < count; i++)
        {
            variance += (linear_acceleration_raw[i] - average) * (linear_acceleration_raw[i] - average);
        }
        variance /= count;
    }
    void updateError(double& varianceMax)
    {
        if(variance < varianceMax)
        {
            error = average;
            last_is_moving = is_moving;
            is_moving = false;
        }
        else
        {
            last_is_moving = is_moving;
            is_moving = true;
        }
    }
    void insertData(double newData, double varianceMax)
    {
        if(count < 100)
        {
            linear_acceleration_raw[count] = newData;
            count++;
        }
        else
        {
            for(int i = 0; i < 99; i++ )
            {
                linear_acceleration_raw[i] = linear_acceleration_raw[i + 1];
            }
            linear_acceleration_raw[99] = newData;
            updateVariance();
            updateError(varianceMax);
        }
    }
};
class location_controller
{
public:
    double linear_velocity_raw[100];
    int duration[99];
    int count;
    double average;
    double variance;
    double error;
    location_controller()
    {
        linear_velocity_raw[0] = 0;
        duration[0] = 0;
        count = 0;
        average = 0;
        variance = 0;
        error = 0;
    }
    void updateError()
    {
        for(int i = 0; i < 99; i++)
        {
            error += (linear_velocity_raw[i] + linear_velocity_raw[i + 1]) * 0.5 * duration[i + 1] / 1000000000;
        }
    }
    void insertData(double newVelocity, int  newDuration, bool is_moving)
    {
        if(count < 100)
        {
            linear_velocity_raw[count] = newVelocity;
            duration[count] = newDuration;
            count ++;
        }
        else
        {
            for(int i = 0; i < 99; i++ )
            {
                linear_velocity_raw[i] = linear_velocity_raw[i + 1];
                duration[i] = duration [i + 1];
            }
            linear_velocity_raw[99] = newVelocity;
            duration[99] = newDuration;
        }
        if(!is_moving)
        {
            updateError();
        }
    }
    
};
void four_num_mult(double w1, double x1, double y1, double z1, double w2, double x2, double y2, double z2, double& w3, double& x3, double& y3, double& z3)
{
    w3 = (w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2);
    x3 = (w1 * x2 + x1 * w2 + y1 * z2 - z1 * y2);
    y3 = (w1 * y2 + y1 * w2 + z1 * x2 - x1 * z2);
    z3 = (w1 * z2 + z1 * w2 + x1 * y2 - y1 * x2);
}
void imuCallback(const sensor_msgs::ImuConstPtr& msg)
{
    //static bool flag_lowPass = true;
    //static double last_linear_acceleration_x_msg = 0, last_linear_acceleration_y_msg = 0, last_linear_acceleration_z_msg = 0;
    
    //double linear_acceleration_x_msg = 0, linear_acceleration_y_msg = 0, linear_acceleration_z_msg = 0;
    tf::Quaternion q;
    tf::quaternionMsgToTF(msg->orientation, q);
    tf::Matrix3x3(q).getRPY(roll, pitch, yaw);
    roll -= 0.01865829194179713113;
    pitch -= 0.00279585943802088437;
    ros::param::set("/yaw", yaw);
    ros::param::set("/pitch", pitch);
    ros::param::set("/roll", roll);
    //ROS_INFO("roll%.12lf, pitch%.12lf, yaw%.12lf", roll / PI * 180, pitch / PI * 180, yaw/ PI * 180);
/*
    //低通滤波
    if(flag_lowPass)
    {
        flag_lowPass = false;
        last_linear_acceleration_x_msg = msg->linear_acceleration.x;
        last_linear_acceleration_z_msg = msg->linear_acceleration.z;
        last_linear_acceleration_y_msg = msg->linear_acceleration.y;
    }
    else
    {
        linear_acceleration_x_msg = k_x0 * msg->linear_acceleration.x + (1 - k_x0) * last_linear_acceleration_x_msg;
        last_linear_acceleration_x_msg = linear_acceleration_x_msg;

        linear_acceleration_y_msg = k_y0 * msg->linear_acceleration.y + (1 - k_y0) * last_linear_acceleration_y_msg;
        last_linear_acceleration_y_msg = linear_acceleration_y_msg;

        linear_acceleration_z_msg = k_z0 * msg->linear_acceleration.z + (1 - k_z0) * last_linear_acceleration_z_msg;
        last_linear_acceleration_z_msg = linear_acceleration_z_msg;
    }

   //比例尺调整
    if(msg->linear_acceleration.x > 0)
    {
        linear_acceleration_x_msg = linear_acceleration_x_msg / 97648.4979180416703457 * 97708.5588791172922356;
    }
    else
    {
        linear_acceleration_x_msg = linear_acceleration_x_msg / 97831.5928680142678786 * 97708.5588791172922356;
    }
    if(msg->linear_acceleration.y > 0)
    {
        linear_acceleration_y_msg = linear_acceleration_y_msg / 97940.0281369405420264 * 97708.5588791172922356;
    }
    else
    {
        linear_acceleration_y_msg = linear_acceleration_y_msg / 97629.4267177577858092 * 97708.5588791172922356;
    }
    if(msg->linear_acceleration.z < 0)
    {
        linear_acceleration_z_msg = linear_acceleration_z_msg / 97789.6638300983759109 * 97708.5588791172922356;
    }
    else
    {
        linear_acceleration_z_msg = linear_acceleration_z_msg;
    }
    
    double linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world, linear_acceleration_w;
    double linear_acceleration_x_car, linear_acceleration_y_car, linear_acceleration_z_car;
*/
    //转为世界坐标系
    //four_num_mult(msg->orientation.w, msg->orientation.x, msg->orientation.y, msg->orientation.z, 0, linear_acceleration_x_msg, linear_acceleration_y_msg, linear_acceleration_z_msg, linear_acceleration_w, linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world);
    //four_num_mult(linear_acceleration_w, linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world, msg->orientation.w, 0 - msg->orientation.x, 0 - msg->orientation.y, 0 - msg->orientation.z, linear_acceleration_w, linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world);

    //调零
    //linear_acceleration_x_world -= 0.001 - 0.00068265913061043948;
    //linear_acceleration_y_world -= -0.0432535613068771;
    //linear_acceleration_z_world -= (9.75428169703640596708 + 0.00045785053283986787);

    //转回相机坐标系
    //four_num_mult(msg->orientation.w, 0 - msg->orientation.x, 0 - msg->orientation.y, 0 - msg->orientation.z, 0, linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world, linear_acceleration_w, linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world);
    //four_num_mult(linear_acceleration_w, linear_acceleration_x_world, linear_acceleration_y_world, linear_acceleration_z_world, msg->orientation.w, msg->orientation.x, msg->orientation.y, msg->orientation.z, linear_acceleration_w, linear_acceleration_x_car, linear_acceleration_y_car, linear_acceleration_z_car);

    //计算时间间隔
    /*
    int duration = 0, now_nsec = 0;
    static int last_nsec = 0;
    static double last_linear_acceleration_x;
    static bool flag_linearVelocity = true, flag_linearLocation = true;
    static double linear_velocity_x;
    double now_linear_acceleration_x;
    static velocity_controller linear_velocity_x_controller;
    static double last_linear_velocity_x = 0;
    double now_linear_velocity_x = 0;
    static double linear_location_x = 0;
    linear_velocity_x_controller.insertData(linear_acceleration_x_car, 0.002);
    static location_controller linear_location_x_controller;
    */
    //ROS_INFO("%lf", linear_acceleration_x_controller.getAverage());


    //调试用
    //count ++;
    //adj_x += linear_acceleration_x_world;
    //adj_y += linear_acceleration_y_world;
    //adj_z += linear_acceleration_z_world;
    //if(count > 200 && adj_x < linear_acceleration_x_controller.variance)adj_x = linear_acceleration_x_controller.variance;
    //ROS_INFO("count:%d, x:%.16lf, y:%.16lf, z:%.16lf", count, adj_x, adj_y, adj_z);
/*
    if(flag_linearVelocity)
    {
        flag_linearVelocity = false;
        last_nsec = msg->header.stamp.nsec;
        last_linear_acceleration_x = linear_acceleration_x_car - linear_velocity_x_controller.error;
    }
    else
    {
        now_nsec = msg->header.stamp.nsec;
        now_linear_acceleration_x = linear_acceleration_x_car - linear_velocity_x_controller.error;
        if(now_nsec > last_nsec)
        {
            duration = now_nsec - last_nsec;
        }
        else
        {
            duration = 1000000000 - last_nsec + now_nsec;
        }
        last_nsec = now_nsec;
        if(!linear_velocity_x_controller.is_moving)
        {
            linear_velocity_x = 0;
        }
        else
        {
            linear_velocity_x += (last_linear_acceleration_x + now_linear_acceleration_x) * 0.5 * duration / 1000000000;
        }
        last_linear_acceleration_x = now_linear_acceleration_x;
        linear_location_x_controller.insertData(linear_velocity_x, duration, linear_velocity_x_controller.is_moving);
        if(flag_linearLocation)
        {
            flag_linearLocation = false;
            last_linear_velocity_x = linear_velocity_x;
        }
        else
        {
            if(linear_velocity_x_controller.is_moving)
            {
                now_linear_velocity_x = linear_velocity_x;
                linear_location_x += (now_linear_velocity_x + last_linear_velocity_x) * 0.5 * duration / 1000000000;
            }
            else
            {
                if(linear_velocity_x_controller.is_moving == false && linear_velocity_x_controller.last_is_moving == true)
                {
                    linear_location_x -= linear_location_x_controller.error;
                    linear_location_x_controller.error = 0;
                }
            }
        }
    }
    */
    //ROS_INFO("%.12f", x);
    //std_msgs::Float64 testMsg;
    //testMsg.data = linear_location_x;
    //count++;
    //if(count >= 10)
    //{
    //testx.publish(testMsg);
        //count = 0;
    //}
    
    //testMsg.data = linear_acceleration_y_car;
    //testy.publish(testMsg);
    //testMsg.data = linear_acceleration_z_car;
    //testz.publish(testMsg);
}
/*void paramCallback(const config::paramConstPtr& msg)
{
    k_x0 = msg->k_x0;
    k_x1 = msg->k_x1;
    k_y0 = msg->k_y0;
    k_y1 = msg->k_y1;
    k_z0 = msg->k_z0;
    k_z1 = msg->k_z1;
    k_test = msg->k_test;
}*/
int main(int argc, char **argv)
{
    ros::init(argc, argv, "imu_node");
    ros::NodeHandle n;
    ros::Subscriber sub = n.subscribe("/imu/data", 1, &imuCallback);

    //ros::Subscriber paramSub = n.subscribe("/param", 1, &paramCallback);
    //testx = n.advertise<std_msgs::Float64>("/testx", 1);
    //testy = n.advertise<std_msgs::Float64>("/testy", 1);
    //testz = n.advertise<std_msgs::Float64>("/testz", 1);
    ros::spin();
}