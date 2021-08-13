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

    param_msg.CONF_THRESH = 0.7;
    if(param_msg.CONF_THRESH != config.CONF_THRESH)
    {
        param_msg.CONF_THRESH = config.CONF_THRESH;
        param_pub.publish(param_msg);
    }

    param_msg.NMS_THRESH = 0.4;
    if(param_msg.NMS_THRESH != config.NMS_THRESH)
    {
        param_msg.NMS_THRESH = config.NMS_THRESH;
        param_pub.publish(param_msg);
    }
   
}