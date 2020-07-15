;; Auto-generated. Do not edit!


(when (boundp 'vaja01::string_ID)
  (if (not (find-package "VAJA01"))
    (make-package "VAJA01"))
  (shadow 'string_ID (find-package "VAJA01")))
(unless (find-package "VAJA01::STRING_ID")
  (make-package "VAJA01::STRING_ID"))

(in-package "ROS")
;;//! \htmlinclude string_ID.msg.html


(defclass vaja01::string_ID
  :super ros::object
  :slots (_content _seqID ))

(defmethod vaja01::string_ID
  (:init
   (&key
    ((:content __content) "")
    ((:seqID __seqID) 0)
    )
   (send-super :init)
   (setq _content (string __content))
   (setq _seqID (round __seqID))
   self)
  (:content
   (&optional __content)
   (if __content (setq _content __content)) _content)
  (:seqID
   (&optional __seqID)
   (if __seqID (setq _seqID __seqID)) _seqID)
  (:serialization-length
   ()
   (+
    ;; string _content
    4 (length _content)
    ;; int32 _seqID
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _content
       (write-long (length _content) s) (princ _content s)
     ;; int32 _seqID
       (write-long _seqID s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _content
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _content (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _seqID
     (setq _seqID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get vaja01::string_ID :md5sum-) "b57dc76242a9a2500d39577844d88d65")
(setf (get vaja01::string_ID :datatype-) "vaja01/string_ID")
(setf (get vaja01::string_ID :definition-)
      "string content
int32 seqID
")



(provide :vaja01/string_ID "b57dc76242a9a2500d39577844d88d65")


