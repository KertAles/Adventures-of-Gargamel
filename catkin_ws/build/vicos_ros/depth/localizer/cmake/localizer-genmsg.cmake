# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "localizer: 0 messages, 1 services")

set(MSG_I_FLAGS "-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Ivisualization_msgs:/opt/ros/kinetic/share/visualization_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(localizer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" NAME_WE)
add_custom_target(_localizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localizer" "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(localizer
  "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localizer
)

### Generating Module File
_generate_module_cpp(localizer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localizer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(localizer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(localizer_generate_messages localizer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" NAME_WE)
add_dependencies(localizer_generate_messages_cpp _localizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localizer_gencpp)
add_dependencies(localizer_gencpp localizer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localizer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(localizer
  "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localizer
)

### Generating Module File
_generate_module_eus(localizer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localizer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(localizer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(localizer_generate_messages localizer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" NAME_WE)
add_dependencies(localizer_generate_messages_eus _localizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localizer_geneus)
add_dependencies(localizer_geneus localizer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localizer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(localizer
  "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localizer
)

### Generating Module File
_generate_module_lisp(localizer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localizer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(localizer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(localizer_generate_messages localizer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" NAME_WE)
add_dependencies(localizer_generate_messages_lisp _localizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localizer_genlisp)
add_dependencies(localizer_genlisp localizer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localizer_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(localizer
  "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localizer
)

### Generating Module File
_generate_module_nodejs(localizer
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localizer
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(localizer_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(localizer_generate_messages localizer_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" NAME_WE)
add_dependencies(localizer_generate_messages_nodejs _localizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localizer_gennodejs)
add_dependencies(localizer_gennodejs localizer_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localizer_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(localizer
  "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer
)

### Generating Module File
_generate_module_py(localizer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(localizer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(localizer_generate_messages localizer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/depth/localizer/srv/Localize.srv" NAME_WE)
add_dependencies(localizer_generate_messages_py _localizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localizer_genpy)
add_dependencies(localizer_genpy localizer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localizer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localizer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(localizer_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(localizer_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(localizer_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET visualization_msgs_generate_messages_cpp)
  add_dependencies(localizer_generate_messages_cpp visualization_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localizer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(localizer_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(localizer_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(localizer_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET visualization_msgs_generate_messages_eus)
  add_dependencies(localizer_generate_messages_eus visualization_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localizer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(localizer_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(localizer_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(localizer_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET visualization_msgs_generate_messages_lisp)
  add_dependencies(localizer_generate_messages_lisp visualization_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localizer
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(localizer_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(localizer_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(localizer_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET visualization_msgs_generate_messages_nodejs)
  add_dependencies(localizer_generate_messages_nodejs visualization_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localizer/.+/__init__.pyc?$"
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(localizer_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(localizer_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(localizer_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET visualization_msgs_generate_messages_py)
  add_dependencies(localizer_generate_messages_py visualization_msgs_generate_messages_py)
endif()
