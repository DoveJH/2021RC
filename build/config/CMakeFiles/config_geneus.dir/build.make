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
CMAKE_SOURCE_DIR = /home/dovejh/project/RC/RC2021/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dovejh/project/RC/RC2021/build

# Utility rule file for config_geneus.

# Include the progress variables for this target.
include config/CMakeFiles/config_geneus.dir/progress.make

config_geneus: config/CMakeFiles/config_geneus.dir/build.make

.PHONY : config_geneus

# Rule to build all files generated by this target.
config/CMakeFiles/config_geneus.dir/build: config_geneus

.PHONY : config/CMakeFiles/config_geneus.dir/build

config/CMakeFiles/config_geneus.dir/clean:
	cd /home/dovejh/project/RC/RC2021/build/config && $(CMAKE_COMMAND) -P CMakeFiles/config_geneus.dir/cmake_clean.cmake
.PHONY : config/CMakeFiles/config_geneus.dir/clean

config/CMakeFiles/config_geneus.dir/depend:
	cd /home/dovejh/project/RC/RC2021/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dovejh/project/RC/RC2021/src /home/dovejh/project/RC/RC2021/src/config /home/dovejh/project/RC/RC2021/build /home/dovejh/project/RC/RC2021/build/config /home/dovejh/project/RC/RC2021/build/config/CMakeFiles/config_geneus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : config/CMakeFiles/config_geneus.dir/depend
