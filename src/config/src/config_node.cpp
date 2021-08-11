#include <ros/ros.h>
#include <dynamic_reconfigure/server.h>
#include <config/RC2021Config.h>
#include <config/param.h>
ros::Publisher param_pub;

void dynamicCallback(config::RC2021Config &config, uint32_t level);
 
int main(int argc, char **argv) 
{
    ros::init(argc, argv, "config_node");
    ros::NodeHandle n;

    param_pub = n.advertise<config::param>("/param", 10);
    dynamic_reconfigure::Server<config::RC2021Config> server;
    dynamic_reconfigure::Server<config::RC2021Config>::CallbackType f;
    f = boost::bind(&dynamicCallback, _1, _2);
    server.setCallback(f);
    ros::spin();
    return 0;
}
void dynamicCallback(config::RC2021Config &config, uint32_t level)
{
    config::param param_msg;
    param_msg.exposure = 30000;
    if(param_msg.exposure != config.exposure)
    {
        param_msg.exposure = config.exposure;
        param_pub.publish(param_msg);
    }
}