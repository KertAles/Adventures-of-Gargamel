; Auto-generated. Do not edit!


(cl:in-package vaja02-srv)


;//! \htmlinclude Movement-request.msg.html

(cl:defclass <Movement-request> (roslisp-msg-protocol:ros-message)
  ((move_shape
    :reader move_shape
    :initarg :move_shape
    :type cl:string
    :initform "")
   (duration
    :reader duration
    :initarg :duration
    :type cl:integer
    :initform 0))
)

(cl:defclass Movement-request (<Movement-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Movement-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Movement-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vaja02-srv:<Movement-request> is deprecated: use vaja02-srv:Movement-request instead.")))

(cl:ensure-generic-function 'move_shape-val :lambda-list '(m))
(cl:defmethod move_shape-val ((m <Movement-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja02-srv:move_shape-val is deprecated.  Use vaja02-srv:move_shape instead.")
  (move_shape m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <Movement-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja02-srv:duration-val is deprecated.  Use vaja02-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Movement-request>) ostream)
  "Serializes a message object of type '<Movement-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'move_shape))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'move_shape))
  (cl:let* ((signed (cl:slot-value msg 'duration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Movement-request>) istream)
  "Deserializes a message object of type '<Movement-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'move_shape) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'move_shape) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'duration) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Movement-request>)))
  "Returns string type for a service object of type '<Movement-request>"
  "vaja02/MovementRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Movement-request)))
  "Returns string type for a service object of type 'Movement-request"
  "vaja02/MovementRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Movement-request>)))
  "Returns md5sum for a message object of type '<Movement-request>"
  "03ddf760f94194b459db8b360beaa75c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Movement-request)))
  "Returns md5sum for a message object of type 'Movement-request"
  "03ddf760f94194b459db8b360beaa75c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Movement-request>)))
  "Returns full string definition for message of type '<Movement-request>"
  (cl:format cl:nil "string move_shape~%int64 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Movement-request)))
  "Returns full string definition for message of type 'Movement-request"
  (cl:format cl:nil "string move_shape~%int64 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Movement-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'move_shape))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Movement-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Movement-request
    (cl:cons ':move_shape (move_shape msg))
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude Movement-response.msg.html

(cl:defclass <Movement-response> (roslisp-msg-protocol:ros-message)
  ((shape
    :reader shape
    :initarg :shape
    :type cl:string
    :initform ""))
)

(cl:defclass Movement-response (<Movement-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Movement-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Movement-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vaja02-srv:<Movement-response> is deprecated: use vaja02-srv:Movement-response instead.")))

(cl:ensure-generic-function 'shape-val :lambda-list '(m))
(cl:defmethod shape-val ((m <Movement-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja02-srv:shape-val is deprecated.  Use vaja02-srv:shape instead.")
  (shape m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Movement-response>) ostream)
  "Serializes a message object of type '<Movement-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'shape))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'shape))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Movement-response>) istream)
  "Deserializes a message object of type '<Movement-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shape) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'shape) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Movement-response>)))
  "Returns string type for a service object of type '<Movement-response>"
  "vaja02/MovementResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Movement-response)))
  "Returns string type for a service object of type 'Movement-response"
  "vaja02/MovementResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Movement-response>)))
  "Returns md5sum for a message object of type '<Movement-response>"
  "03ddf760f94194b459db8b360beaa75c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Movement-response)))
  "Returns md5sum for a message object of type 'Movement-response"
  "03ddf760f94194b459db8b360beaa75c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Movement-response>)))
  "Returns full string definition for message of type '<Movement-response>"
  (cl:format cl:nil "string shape~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Movement-response)))
  "Returns full string definition for message of type 'Movement-response"
  (cl:format cl:nil "string shape~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Movement-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'shape))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Movement-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Movement-response
    (cl:cons ':shape (shape msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Movement)))
  'Movement-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Movement)))
  'Movement-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Movement)))
  "Returns string type for a service object of type '<Movement>"
  "vaja02/Movement")