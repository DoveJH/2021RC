# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolov5: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iyolov5:/home/nuaa/dovejh/2021RC/src/yolov5/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolov5_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" NAME_WE)
add_custom_target(_yolov5_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolov5" "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolov5
  "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolov5
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolov5_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolov5_generate_messages yolov5_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" NAME_WE)
add_dependencies(yolov5_generate_messages_cpp _yolov5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_gencpp)
add_dependencies(yolov5_gencpp yolov5_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolov5
  "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5
)

### Generating Services

### Generating Module File
_generate_module_eus(yolov5
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolov5_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolov5_generate_messages yolov5_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" NAME_WE)
add_dependencies(yolov5_generate_messages_eus _yolov5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_geneus)
add_dependencies(yolov5_geneus yolov5_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolov5
  "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolov5
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolov5_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolov5_generate_messages yolov5_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" NAME_WE)
add_dependencies(yolov5_generate_messages_lisp _yolov5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_genlisp)
add_dependencies(yolov5_genlisp yolov5_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolov5
  "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolov5
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolov5_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolov5_generate_messages yolov5_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" NAME_WE)
add_dependencies(yolov5_generate_messages_nodejs _yolov5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_gennodejs)
add_dependencies(yolov5_gennodejs yolov5_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolov5
  "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5
)

### Generating Services

### Generating Module File
_generate_module_py(yolov5
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolov5_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolov5_generate_messages yolov5_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuaa/dovejh/2021RC/src/yolov5/msg/result.msg" NAME_WE)
add_dependencies(yolov5_generate_messages_py _yolov5_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolov5_genpy)
add_dependencies(yolov5_genpy yolov5_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolov5_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolov5
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolov5_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolov5
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolov5_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolov5
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolov5_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolov5
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolov5_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolov5
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolov5_generate_messages_py std_msgs_generate_messages_py)
endif()
