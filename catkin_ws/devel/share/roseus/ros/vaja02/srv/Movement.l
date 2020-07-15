;; Auto-generated. Do not edit!


(when (boundp 'vaja02::Movement)
  (if (not (find-package "VAJA02"))
    (make-package "VAJA02"))
  (shadow 'Movement (find-package "VAJA02")))
(unless (find-package "VAJA02::MOVEMENT")
  (make-package "VAJA02::MOVEMENT"))
(unless (find-package "VAJA02::MOVEMENTREQUEST")
  (make-package "VAJA02::MOVEMENTREQUEST"))
(unless (find-package "VAJA02::MOVEMENTRESPONSE")
  (make-package "VAJA02::MOVEMENTRESPONSE"))

(in-package "ROS")





(defclass vaja02::MovementRequest
  :super ros::object
  :slots (_move_shape _duration ))

(defmethod vaja02::MovementRequest
  (:init
   (&key
    ((:move_shape __move_shape) "")
    ((:duration __duration) 0)
    )
   (send-super :init)
   (setq _move_shape (string __move_shape))
   (setq _duration (round __duration))
   self)
  (:move_shape
   (&optional __move_shape)
   (if __move_shape (setq _move_shape __move_shape)) _move_shape)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; string _move_shape
    4 (length _move_shape)
    ;; int64 _duration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _move_shape
       (write-long (length _move_shape) s) (princ _move_shape s)
     ;; int64 _duration
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _duration (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _duration) (= (length (_duration . bv)) 2)) ;; bignum
              (write-long (ash (elt (_duration . bv) 0) 0) s)
              (write-long (ash (elt (_duration . bv) 1) -1) s))
             ((and (class _duration) (= (length (_duration . bv)) 1)) ;; big1
              (write-long (elt (_duration . bv) 0) s)
              (write-long (if (>= _duration 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _duration s)(write-long (if (>= _duration 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _move_shape
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _move_shape (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _duration
#+(or :alpha :irix6 :x86_64)
      (setf _duration (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _duration (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass vaja02::MovementResponse
  :super ros::object
  :slots (_shape ))

(defmethod vaja02::MovementResponse
  (:init
   (&key
    ((:shape __shape) "")
    )
   (send-super :init)
   (setq _shape (string __shape))
   self)
  (:shape
   (&optional __shape)
   (if __shape (setq _shape __shape)) _shape)
  (:serialization-length
   ()
   (+
    ;; string _shape
    4 (length _shape)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _shape
       (write-long (length _shape) s) (princ _shape s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _shape
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shape (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass vaja02::Movement
  :super ros::object
  :slots ())

(setf (get vaja02::Movement :md5sum-) "03ddf760f94194b459db8b360beaa75c")
(setf (get vaja02::Movement :datatype-) "vaja02/Movement")
(setf (get vaja02::Movement :request) vaja02::MovementRequest)
(setf (get vaja02::Movement :response) vaja02::MovementResponse)

(defmethod vaja02::MovementRequest
  (:response () (instance vaja02::MovementResponse :init)))

(setf (get vaja02::MovementRequest :md5sum-) "03ddf760f94194b459db8b360beaa75c")
(setf (get vaja02::MovementRequest :datatype-) "vaja02/MovementRequest")
(setf (get vaja02::MovementRequest :definition-)
      "string move_shape
int64 duration
---
string shape
")

(setf (get vaja02::MovementResponse :md5sum-) "03ddf760f94194b459db8b360beaa75c")
(setf (get vaja02::MovementResponse :datatype-) "vaja02/MovementResponse")
(setf (get vaja02::MovementResponse :definition-)
      "string move_shape
int64 duration
---
string shape
")



(provide :vaja02/Movement "03ddf760f94194b459db8b360beaa75c")


