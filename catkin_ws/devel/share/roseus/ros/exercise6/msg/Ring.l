;; Auto-generated. Do not edit!


(when (boundp 'exercise6::Ring)
  (if (not (find-package "EXERCISE6"))
    (make-package "EXERCISE6"))
  (shadow 'Ring (find-package "EXERCISE6")))
(unless (find-package "EXERCISE6::RING")
  (make-package "EXERCISE6::RING"))

(in-package "ROS")
;;//! \htmlinclude Ring.msg.html


(defclass exercise6::Ring
  :super ros::object
  :slots (_color _app_x _app_y _app_z ))

(defmethod exercise6::Ring
  (:init
   (&key
    ((:color __color) "")
    ((:app_x __app_x) 0.0)
    ((:app_y __app_y) 0.0)
    ((:app_z __app_z) 0.0)
    )
   (send-super :init)
   (setq _color (string __color))
   (setq _app_x (float __app_x))
   (setq _app_y (float __app_y))
   (setq _app_z (float __app_z))
   self)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:app_x
   (&optional __app_x)
   (if __app_x (setq _app_x __app_x)) _app_x)
  (:app_y
   (&optional __app_y)
   (if __app_y (setq _app_y __app_y)) _app_y)
  (:app_z
   (&optional __app_z)
   (if __app_z (setq _app_z __app_z)) _app_z)
  (:serialization-length
   ()
   (+
    ;; string _color
    4 (length _color)
    ;; float64 _app_x
    8
    ;; float64 _app_y
    8
    ;; float64 _app_z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;; float64 _app_x
       (sys::poke _app_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _app_y
       (sys::poke _app_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _app_z
       (sys::poke _app_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _app_x
     (setq _app_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _app_y
     (setq _app_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _app_z
     (setq _app_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get exercise6::Ring :md5sum-) "63915ba74a2bfae4d77cf9f3f4b83726")
(setf (get exercise6::Ring :datatype-) "exercise6/Ring")
(setf (get exercise6::Ring :definition-)
      "string color
float64 app_x
float64 app_y
float64 app_z
")



(provide :exercise6/Ring "63915ba74a2bfae4d77cf9f3f4b83726")


