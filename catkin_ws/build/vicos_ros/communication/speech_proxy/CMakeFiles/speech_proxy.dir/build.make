# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/avrelij/Documents/RINS/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/avrelij/Documents/RINS/catkin_ws/build

# Include any dependencies generated for this target.
include vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/depend.make

# Include the progress variables for this target.
include vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/progress.make

# Include the compile flags for this target's objects.
include vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/flags.make

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/flags.make
vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o: /home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/communication/speech_proxy/src/speech_server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/avrelij/Documents/RINS/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o"
	cd /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o -c /home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/communication/speech_proxy/src/speech_server.cpp

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/speech_proxy.dir/src/speech_server.cpp.i"
	cd /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/communication/speech_proxy/src/speech_server.cpp > CMakeFiles/speech_proxy.dir/src/speech_server.cpp.i

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/speech_proxy.dir/src/speech_server.cpp.s"
	cd /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/communication/speech_proxy/src/speech_server.cpp -o CMakeFiles/speech_proxy.dir/src/speech_server.cpp.s

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.requires:

.PHONY : vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.requires

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.provides: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.requires
	$(MAKE) -f vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/build.make vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.provides.build
.PHONY : vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.provides

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.provides.build: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o


# Object files for target speech_proxy
speech_proxy_OBJECTS = \
"CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o"

# External object files for target speech_proxy
speech_proxy_EXTERNAL_OBJECTS =

/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/build.make
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libroscpp.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/librosconsole.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/librostime.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libcpp_common.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/librostime.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /opt/ros/kinetic/lib/libcpp_common.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
/home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/avrelij/Documents/RINS/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy"
	cd /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/speech_proxy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/build: /home/avrelij/Documents/RINS/catkin_ws/devel/lib/speech_proxy/speech_proxy

.PHONY : vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/build

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/requires: vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/src/speech_server.cpp.o.requires

.PHONY : vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/requires

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/clean:
	cd /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy && $(CMAKE_COMMAND) -P CMakeFiles/speech_proxy.dir/cmake_clean.cmake
.PHONY : vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/clean

vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/depend:
	cd /home/avrelij/Documents/RINS/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/avrelij/Documents/RINS/catkin_ws/src /home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/communication/speech_proxy /home/avrelij/Documents/RINS/catkin_ws/build /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy /home/avrelij/Documents/RINS/catkin_ws/build/vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vicos_ros/communication/speech_proxy/CMakeFiles/speech_proxy.dir/depend

