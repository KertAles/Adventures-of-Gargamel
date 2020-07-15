cmake_minimum_required(VERSION 2.8.3)
project(exercise4)

set(OpenCV_INCLUDE_DIRS
  /usr/local/include
  /usr/local/include/opencv2
)

set(OpenCV_LIB_DIR
  /usr/local/lib
)

set(OpenCV_LIBS
  opencv_core
  opencv_highgui
  opencv_imgcodecs
)


find_package(catkin REQUIRED COMPONENTS
	roscpp
	cv_bridge
	sensor_msgs
	visualization_msgs
	tf2_ros
	nav_msgs
	std_msgs
	geometry_msgs
	message_generation
)
set(OpenCV_DIR /usr/local/share/OpenCV/)
include_directories(OpenCV_DIR)
find_package(OpenCV 3.4.0 REQUIRED)

add_message_files(
  FILES
  turtle_pos.msg
  Person.msg
)
generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package()

#include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})
#add_executable(map_goals src/map_goals.cpp)
#target_link_libraries(map_goals ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

#catkin_install_python(PROGRAMS scripts/detect_rings DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

