;; Auto-generated. Do not edit!


(when (boundp 'vaja01::ArrayOfInts)
  (if (not (find-package "VAJA01"))
    (make-package "VAJA01"))
  (shadow 'ArrayOfInts (find-package "VAJA01")))
(unless (find-package "VAJA01::ARRAYOFINTS")
  (make-package "VAJA01::ARRAYOFINTS"))
(unless (find-package "VAJA01::ARRAYOFINTSREQUEST")
  (make-package "VAJA01::ARRAYOFINTSREQUEST"))
(unless (find-package "VAJA01::ARRAYOFINTSRESPONSE")
  (make-package "VAJA01::ARRAYOFINTSRESPONSE"))

(in-package "ROS")





(defclass vaja01::ArrayOfIntsRequest
  :super ros::object
  :slots (_vrsta ))

(defmethod vaja01::ArrayOfIntsRequest
  (:init
   (&key
    ((:vrsta __vrsta) (make-array 10 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _vrsta __vrsta)
   self)
  (:vrsta
   (&optional __vrsta)
   (if __vrsta (setq _vrsta __vrsta)) _vrsta)
  (:serialization-length
   ()
   (+
    ;; int64[10] _vrsta
    (* 8    10)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64[10] _vrsta
     (dotimes (i 10)
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke (elt _vrsta i) (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class (elt _vrsta i)) (= (length ((elt _vrsta i) . bv)) 2)) ;; bignum
              (write-long (ash (elt ((elt _vrsta i) . bv) 0) 0) s)
              (write-long (ash (elt ((elt _vrsta i) . bv) 1) -1) s))
             ((and (class (elt _vrsta i)) (= (length ((elt _vrsta i) . bv)) 1)) ;; big1
              (write-long (elt ((elt _vrsta i) . bv) 0) s)
              (write-long (if (>= (elt _vrsta i) 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long (elt _vrsta i) s)(write-long (if (>= (elt _vrsta i) 0) 0 #xffffffff) s)))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64[10] _vrsta
   (dotimes (i (length _vrsta))
#+(or :alpha :irix6 :x86_64)
      (setf (elt _vrsta i) (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf (elt _vrsta i) (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
     )
   ;;
   self)
  )

(defclass vaja01::ArrayOfIntsResponse
  :super ros::object
  :slots (_vsota ))

(defmethod vaja01::ArrayOfIntsResponse
  (:init
   (&key
    ((:vsota __vsota) 0)
    )
   (send-super :init)
   (setq _vsota (round __vsota))
   self)
  (:vsota
   (&optional __vsota)
   (if __vsota (setq _vsota __vsota)) _vsota)
  (:serialization-length
   ()
   (+
    ;; int64 _vsota
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _vsota
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _vsota (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _vsota) (= (length (_vsota . bv)) 2)) ;; bignum
              (write-long (ash (elt (_vsota . bv) 0) 0) s)
              (write-long (ash (elt (_vsota . bv) 1) -1) s))
             ((and (class _vsota) (= (length (_vsota . bv)) 1)) ;; big1
              (write-long (elt (_vsota . bv) 0) s)
              (write-long (if (>= _vsota 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _vsota s)(write-long (if (>= _vsota 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _vsota
#+(or :alpha :irix6 :x86_64)
      (setf _vsota (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _vsota (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass vaja01::ArrayOfInts
  :super ros::object
  :slots ())

(setf (get vaja01::ArrayOfInts :md5sum-) "9f68a5f63056c0474865224eaf043dcb")
(setf (get vaja01::ArrayOfInts :datatype-) "vaja01/ArrayOfInts")
(setf (get vaja01::ArrayOfInts :request) vaja01::ArrayOfIntsRequest)
(setf (get vaja01::ArrayOfInts :response) vaja01::ArrayOfIntsResponse)

(defmethod vaja01::ArrayOfIntsRequest
  (:response () (instance vaja01::ArrayOfIntsResponse :init)))

(setf (get vaja01::ArrayOfIntsRequest :md5sum-) "9f68a5f63056c0474865224eaf043dcb")
(setf (get vaja01::ArrayOfIntsRequest :datatype-) "vaja01/ArrayOfIntsRequest")
(setf (get vaja01::ArrayOfIntsRequest :definition-)
      "int64[10] vrsta
---
int64 vsota
")

(setf (get vaja01::ArrayOfIntsResponse :md5sum-) "9f68a5f63056c0474865224eaf043dcb")
(setf (get vaja01::ArrayOfIntsResponse :datatype-) "vaja01/ArrayOfIntsResponse")
(setf (get vaja01::ArrayOfIntsResponse :definition-)
      "int64[10] vrsta
---
int64 vsota
")



(provide :vaja01/ArrayOfInts "9f68a5f63056c0474865224eaf043dcb")


