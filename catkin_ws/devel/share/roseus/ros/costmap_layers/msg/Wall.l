;; Auto-generated. Do not edit!


(when (boundp 'costmap_layers::Wall)
  (if (not (find-package "COSTMAP_LAYERS"))
    (make-package "COSTMAP_LAYERS"))
  (shadow 'Wall (find-package "COSTMAP_LAYERS")))
(unless (find-package "COSTMAP_LAYERS::WALL")
  (make-package "COSTMAP_LAYERS::WALL"))

(in-package "ROS")
;;//! \htmlinclude Wall.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass costmap_layers::Wall
  :super ros::object
  :slots (_identifier _from _to _width ))

(defmethod costmap_layers::Wall
  (:init
   (&key
    ((:identifier __identifier) "")
    ((:from __from) (instance geometry_msgs::Point :init))
    ((:to __to) (instance geometry_msgs::Point :init))
    ((:width __width) 0)
    )
   (send-super :init)
   (setq _identifier (string __identifier))
   (setq _from __from)
   (setq _to __to)
   (setq _width (round __width))
   self)
  (:identifier
   (&optional __identifier)
   (if __identifier (setq _identifier __identifier)) _identifier)
  (:from
   (&rest __from)
   (if (keywordp (car __from))
       (send* _from __from)
     (progn
       (if __from (setq _from (car __from)))
       _from)))
  (:to
   (&rest __to)
   (if (keywordp (car __to))
       (send* _to __to)
     (progn
       (if __to (setq _to (car __to)))
       _to)))
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:serialization-length
   ()
   (+
    ;; string _identifier
    4 (length _identifier)
    ;; geometry_msgs/Point _from
    (send _from :serialization-length)
    ;; geometry_msgs/Point _to
    (send _to :serialization-length)
    ;; int32 _width
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _identifier
       (write-long (length _identifier) s) (princ _identifier s)
     ;; geometry_msgs/Point _from
       (send _from :serialize s)
     ;; geometry_msgs/Point _to
       (send _to :serialize s)
     ;; int32 _width
       (write-long _width s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _identifier
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _identifier (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Point _from
     (send _from :deserialize buf ptr-) (incf ptr- (send _from :serialization-length))
   ;; geometry_msgs/Point _to
     (send _to :deserialize buf ptr-) (incf ptr- (send _to :serialization-length))
   ;; int32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get costmap_layers::Wall :md5sum-) "68c0f9e0fd6bb3eb2070700be3dd1d6a")
(setf (get costmap_layers::Wall :datatype-) "costmap_layers/Wall")
(setf (get costmap_layers::Wall :definition-)
      "string identifier
geometry_msgs/Point from
geometry_msgs/Point to
int32 width


================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :costmap_layers/Wall "68c0f9e0fd6bb3eb2070700be3dd1d6a")


