;; Auto-generated. Do not edit!


(when (boundp 'localizer::Localize)
  (if (not (find-package "LOCALIZER"))
    (make-package "LOCALIZER"))
  (shadow 'Localize (find-package "LOCALIZER")))
(unless (find-package "LOCALIZER::LOCALIZE")
  (make-package "LOCALIZER::LOCALIZE"))
(unless (find-package "LOCALIZER::LOCALIZEREQUEST")
  (make-package "LOCALIZER::LOCALIZEREQUEST"))
(unless (find-package "LOCALIZER::LOCALIZERESPONSE")
  (make-package "LOCALIZER::LOCALIZERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass localizer::LocalizeRequest
  :super ros::object
  :slots (_header _point _scope ))

(defmethod localizer::LocalizeRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:point __point) (instance geometry_msgs::Point :init))
    ((:scope __scope) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   (setq _scope (round __scope))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:scope
   (&optional __scope)
   (if __scope (setq _scope __scope)) _scope)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ;; int32 _scope
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;; int32 _scope
       (write-long _scope s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; int32 _scope
     (setq _scope (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass localizer::LocalizeResponse
  :super ros::object
  :slots (_pose ))

(defmethod localizer::LocalizeResponse
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass localizer::Localize
  :super ros::object
  :slots ())

(setf (get localizer::Localize :md5sum-) "a308643c2731f421c811b956395b3a0b")
(setf (get localizer::Localize :datatype-) "localizer/Localize")
(setf (get localizer::Localize :request) localizer::LocalizeRequest)
(setf (get localizer::Localize :response) localizer::LocalizeResponse)

(defmethod localizer::LocalizeRequest
  (:response () (instance localizer::LocalizeResponse :init)))

(setf (get localizer::LocalizeRequest :md5sum-) "a308643c2731f421c811b956395b3a0b")
(setf (get localizer::LocalizeRequest :datatype-) "localizer/LocalizeRequest")
(setf (get localizer::LocalizeRequest :definition-)
      "Header header
geometry_msgs/Point point
int32 scope

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
geometry_msgs/Pose pose


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
")

(setf (get localizer::LocalizeResponse :md5sum-) "a308643c2731f421c811b956395b3a0b")
(setf (get localizer::LocalizeResponse :datatype-) "localizer/LocalizeResponse")
(setf (get localizer::LocalizeResponse :definition-)
      "Header header
geometry_msgs/Point point
int32 scope

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
---
geometry_msgs/Pose pose


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
")



(provide :localizer/Localize "a308643c2731f421c811b956395b3a0b")


