cmake_minimum_required(VERSION 2.8.3)
project(mv_driver)
add_compile_options(-std=c++11)
find_package(catkin REQUIRED COMPONENTS
 cv_bridge
 image_transport
 roscpp
 sensor_msgs
 std_msgs
)
find_package( OpenCV 4 REQUIRED )
catkin_package()
include_directories(
 include
 ${catkin_INCLUDE_DIRS}
)

set(ROS_BUILD_TYPE Release)
set(CMAKE_BUILD_TYPE Release)

add_executable(${PROJECT_NAME}_node
    src/MVCamera_node.cpp
    src/MVCamera.cpp
    )
EXECUTE_PROCESS( COMMAND uname -m COMMAND tr -d '\n' OUTPUT_VARIABLE ARCHITECTURE )
message( STATUS "Architecture: ${ARCHITECTURE}" )
## Specify libraries to link a library or executable target against
if( ${ARCHITECTURE} STREQUAL "x86_64" )
target_link_libraries(${PROJECT_NAME}_node
  ${catkin_LIBRARIES}
  ${OpenCV_LIBRARIES}
${PROJECT_SOURCE_DIR}/lib/x64/libMVSDK.so
)
else()
   target_link_libraries(${PROJECT_NAME}_node
     ${catkin_LIBRARIES}
     ${OpenCV_LIBRARIES}
  ${PROJECT_SOURCE_DIR}/lib/arm64/libMVSDK.so
   )
endif()
