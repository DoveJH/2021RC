# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolov5: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iyolov5:/home/dovejh/project/RC/RC2021/src/yolov5/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators

add_custom_target(yolov5_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/dovejh/project/RC/RC2021/src/yolov5/msg/result.msg" NAME_WE)
add_custom_target(_yolov5_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5" "/home/dovejh/project/RC/RC2021/src/yolov5/msg/result.msg" ""
)

#
#  langs = 
#


