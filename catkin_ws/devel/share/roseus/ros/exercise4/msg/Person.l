;; Auto-generated. Do not edit!


(when (boundp 'exercise4::Person)
  (if (not (find-package "EXERCISE4"))
    (make-package "EXERCISE4"))
  (shadow 'Person (find-package "EXERCISE4")))
(unless (find-package "EXERCISE4::PERSON")
  (make-package "EXERCISE4::PERSON"))

(in-package "ROS")
;;//! \htmlinclude Person.msg.html


(defclass exercise4::Person
  :super ros::object
  :slots (_id _app_x _app_y _app_z _hair_col _hair_len ))

(defmethod exercise4::Person
  (:init
   (&key
    ((:id __id) 0)
    ((:app_x __app_x) 0.0)
    ((:app_y __app_y) 0.0)
    ((:app_z __app_z) 0.0)
    ((:hair_col __hair_col) "")
    ((:hair_len __hair_len) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _app_x (float __app_x))
   (setq _app_y (float __app_y))
   (setq _app_z (float __app_z))
   (setq _hair_col (string __hair_col))
   (setq _hair_len (string __hair_len))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:app_x
   (&optional __app_x)
   (if __app_x (setq _app_x __app_x)) _app_x)
  (:app_y
   (&optional __app_y)
   (if __app_y (setq _app_y __app_y)) _app_y)
  (:app_z
   (&optional __app_z)
   (if __app_z (setq _app_z __app_z)) _app_z)
  (:hair_col
   (&optional __hair_col)
   (if __hair_col (setq _hair_col __hair_col)) _hair_col)
  (:hair_len
   (&optional __hair_len)
   (if __hair_len (setq _hair_len __hair_len)) _hair_len)
  (:serialization-length
   ()
   (+
    ;; int64 _id
    8
    ;; float64 _app_x
    8
    ;; float64 _app_y
    8
    ;; float64 _app_z
    8
    ;; string _hair_col
    4 (length _hair_col)
    ;; string _hair_len
    4 (length _hair_len)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id) (= (length (_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id . bv) 0) 0) s)
              (write-long (ash (elt (_id . bv) 1) -1) s))
             ((and (class _id) (= (length (_id . bv)) 1)) ;; big1
              (write-long (elt (_id . bv) 0) s)
              (write-long (if (>= _id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id s)(write-long (if (>= _id 0) 0 #xffffffff) s)))
     ;; float64 _app_x
       (sys::poke _app_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _app_y
       (sys::poke _app_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _app_z
       (sys::poke _app_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _hair_col
       (write-long (length _hair_col) s) (princ _hair_col s)
     ;; string _hair_len
       (write-long (length _hair_len) s) (princ _hair_len s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _id
#+(or :alpha :irix6 :x86_64)
      (setf _id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _app_x
     (setq _app_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _app_y
     (setq _app_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _app_z
     (setq _app_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _hair_col
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hair_col (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _hair_len
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hair_len (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get exercise4::Person :md5sum-) "7cad3912a48d80acec18d17fde7286bc")
(setf (get exercise4::Person :datatype-) "exercise4/Person")
(setf (get exercise4::Person :definition-)
      "int64 id
float64 app_x
float64 app_y
float64 app_z
string hair_col
string hair_len
")



(provide :exercise4/Person "7cad3912a48d80acec18d17fde7286bc")


