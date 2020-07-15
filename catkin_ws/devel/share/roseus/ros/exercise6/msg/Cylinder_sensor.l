;; Auto-generated. Do not edit!


(when (boundp 'exercise6::Cylinder_sensor)
  (if (not (find-package "EXERCISE6"))
    (make-package "EXERCISE6"))
  (shadow 'Cylinder_sensor (find-package "EXERCISE6")))
(unless (find-package "EXERCISE6::CYLINDER_SENSOR")
  (make-package "EXERCISE6::CYLINDER_SENSOR"))

(in-package "ROS")
;;//! \htmlinclude Cylinder_sensor.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "VISUALIZATION_MSGS"))
  (ros::roseus-add-msgs "visualization_msgs"))


(defclass exercise6::Cylinder_sensor
  :super ros::object
  :slots (_c_image _c_marker ))

(defmethod exercise6::Cylinder_sensor
  (:init
   (&key
    ((:c_image __c_image) (instance sensor_msgs::Image :init))
    ((:c_marker __c_marker) (instance visualization_msgs::Marker :init))
    )
   (send-super :init)
   (setq _c_image __c_image)
   (setq _c_marker __c_marker)
   self)
  (:c_image
   (&rest __c_image)
   (if (keywordp (car __c_image))
       (send* _c_image __c_image)
     (progn
       (if __c_image (setq _c_image (car __c_image)))
       _c_image)))
  (:c_marker
   (&rest __c_marker)
   (if (keywordp (car __c_marker))
       (send* _c_marker __c_marker)
     (progn
       (if __c_marker (setq _c_marker (car __c_marker)))
       _c_marker)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _c_image
    (send _c_image :serialization-length)
    ;; visualization_msgs/Marker _c_marker
    (send _c_marker :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _c_image
       (send _c_image :serialize s)
     ;; visualization_msgs/Marker _c_marker
       (send _c_marker :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _c_image
     (send _c_image :deserialize buf ptr-) (incf ptr- (send _c_image :serialization-length))
   ;; visualization_msgs/Marker _c_marker
     (send _c_marker :deserialize buf ptr-) (incf ptr- (send _c_marker :serialization-length))
   ;;
   self)
  )

(setf (get exercise6::Cylinder_sensor :md5sum-) "668b13a2b951b8f5b02acaa164983bdd")
(setf (get exercise6::Cylinder_sensor :datatype-) "exercise6/Cylinder_sensor")
(setf (get exercise6::Cylinder_sensor :definition-)
      "sensor_msgs/Image c_image
visualization_msgs/Marker c_marker
================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: visualization_msgs/Marker
# See http://www.ros.org/wiki/rviz/DisplayTypes/Marker and http://www.ros.org/wiki/rviz/Tutorials/Markers%3A%20Basic%20Shapes for more information on using this message with rviz

uint8 ARROW=0
uint8 CUBE=1
uint8 SPHERE=2
uint8 CYLINDER=3
uint8 LINE_STRIP=4
uint8 LINE_LIST=5
uint8 CUBE_LIST=6
uint8 SPHERE_LIST=7
uint8 POINTS=8
uint8 TEXT_VIEW_FACING=9
uint8 MESH_RESOURCE=10
uint8 TRIANGLE_LIST=11

uint8 ADD=0
uint8 MODIFY=0
uint8 DELETE=2
uint8 DELETEALL=3

Header header                        # header for time/frame information
string ns                            # Namespace to place this object in... used in conjunction with id to create a unique name for the object
int32 id 		                         # object ID useful in conjunction with the namespace for manipulating and deleting the object later
int32 type 		                       # Type of object
int32 action 	                       # 0 add/modify an object, 1 (deprecated), 2 deletes an object, 3 deletes all objects
geometry_msgs/Pose pose                 # Pose of the object
geometry_msgs/Vector3 scale             # Scale of the object 1,1,1 means default (usually 1 meter square)
std_msgs/ColorRGBA color             # Color [0.0-1.0]
duration lifetime                    # How long the object should last before being automatically deleted.  0 means forever
bool frame_locked                    # If this marker should be frame-locked, i.e. retransformed into its frame every timestep

#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
geometry_msgs/Point[] points
#Only used if the type specified has some use for them (eg. POINTS, LINE_STRIP, ...)
#number of colors must either be 0 or equal to the number of points
#NOTE: alpha is not yet used
std_msgs/ColorRGBA[] colors

# NOTE: only used for text markers
string text

# NOTE: only used for MESH_RESOURCE markers
string mesh_resource
bool mesh_use_embedded_materials

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

")



(provide :exercise6/Cylinder_sensor "668b13a2b951b8f5b02acaa164983bdd")


