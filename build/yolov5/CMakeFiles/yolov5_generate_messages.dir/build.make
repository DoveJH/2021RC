# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nuaa/dovejh/2021RC/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nuaa/dovejh/2021RC/build

# Utility rule file for yolov5_generate_messages.

# Include the progress variables for this target.
include yolov5/CMakeFiles/yolov5_generate_messages.dir/progress.make

yolov5_generate_messages: yolov5/CMakeFiles/yolov5_generate_messages.dir/build.make

.PHONY : yolov5_generate_messages

# Rule to build all files generated by this target.
yolov5/CMakeFiles/yolov5_generate_messages.dir/build: yolov5_generate_messages

.PHONY : yolov5/CMakeFiles/yolov5_generate_messages.dir/build

yolov5/CMakeFiles/yolov5_generate_messages.dir/clean:
	cd /home/nuaa/dovejh/2021RC/build/yolov5 && $(CMAKE_COMMAND) -P CMakeFiles/yolov5_generate_messages.dir/cmake_clean.cmake
.PHONY : yolov5/CMakeFiles/yolov5_generate_messages.dir/clean

yolov5/CMakeFiles/yolov5_generate_messages.dir/depend:
	cd /home/nuaa/dovejh/2021RC/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nuaa/dovejh/2021RC/src /home/nuaa/dovejh/2021RC/src/yolov5 /home/nuaa/dovejh/2021RC/build /home/nuaa/dovejh/2021RC/build/yolov5 /home/nuaa/dovejh/2021RC/build/yolov5/CMakeFiles/yolov5_generate_messages.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : yolov5/CMakeFiles/yolov5_generate_messages.dir/depend

