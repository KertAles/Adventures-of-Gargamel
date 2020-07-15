; Auto-generated. Do not edit!


(cl:in-package exercise6-msg)


;//! \htmlinclude Ring.msg.html

(cl:defclass <Ring> (roslisp-msg-protocol:ros-message)
  ((color
    :reader color
    :initarg :color
    :type cl:string
    :initform "")
   (app_x
    :reader app_x
    :initarg :app_x
    :type cl:float
    :initform 0.0)
   (app_y
    :reader app_y
    :initarg :app_y
    :type cl:float
    :initform 0.0)
   (app_z
    :reader app_z
    :initarg :app_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass Ring (<Ring>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ring>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ring)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name exercise6-msg:<Ring> is deprecated: use exercise6-msg:Ring instead.")))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <Ring>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise6-msg:color-val is deprecated.  Use exercise6-msg:color instead.")
  (color m))

(cl:ensure-generic-function 'app_x-val :lambda-list '(m))
(cl:defmethod app_x-val ((m <Ring>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise6-msg:app_x-val is deprecated.  Use exercise6-msg:app_x instead.")
  (app_x m))

(cl:ensure-generic-function 'app_y-val :lambda-list '(m))
(cl:defmethod app_y-val ((m <Ring>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise6-msg:app_y-val is deprecated.  Use exercise6-msg:app_y instead.")
  (app_y m))

(cl:ensure-generic-function 'app_z-val :lambda-list '(m))
(cl:defmethod app_z-val ((m <Ring>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader exercise6-msg:app_z-val is deprecated.  Use exercise6-msg:app_z instead.")
  (app_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ring>) ostream)
  "Serializes a message object of type '<Ring>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'app_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'app_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'app_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ring>) istream)
  "Deserializes a message object of type '<Ring>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'app_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'app_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'app_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ring>)))
  "Returns string type for a message object of type '<Ring>"
  "exercise6/Ring")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ring)))
  "Returns string type for a message object of type 'Ring"
  "exercise6/Ring")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ring>)))
  "Returns md5sum for a message object of type '<Ring>"
  "63915ba74a2bfae4d77cf9f3f4b83726")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ring)))
  "Returns md5sum for a message object of type 'Ring"
  "63915ba74a2bfae4d77cf9f3f4b83726")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ring>)))
  "Returns full string definition for message of type '<Ring>"
  (cl:format cl:nil "string color~%float64 app_x~%float64 app_y~%float64 app_z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ring)))
  "Returns full string definition for message of type 'Ring"
  (cl:format cl:nil "string color~%float64 app_x~%float64 app_y~%float64 app_z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ring>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'color))
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ring>))
  "Converts a ROS message object to a list"
  (cl:list 'Ring
    (cl:cons ':color (color msg))
    (cl:cons ':app_x (app_x msg))
    (cl:cons ':app_y (app_y msg))
    (cl:cons ':app_z (app_z msg))
))
