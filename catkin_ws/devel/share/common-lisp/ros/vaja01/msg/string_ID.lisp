; Auto-generated. Do not edit!


(cl:in-package vaja01-msg)


;//! \htmlinclude string_ID.msg.html

(cl:defclass <string_ID> (roslisp-msg-protocol:ros-message)
  ((content
    :reader content
    :initarg :content
    :type cl:string
    :initform "")
   (seqID
    :reader seqID
    :initarg :seqID
    :type cl:integer
    :initform 0))
)

(cl:defclass string_ID (<string_ID>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <string_ID>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'string_ID)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vaja01-msg:<string_ID> is deprecated: use vaja01-msg:string_ID instead.")))

(cl:ensure-generic-function 'content-val :lambda-list '(m))
(cl:defmethod content-val ((m <string_ID>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja01-msg:content-val is deprecated.  Use vaja01-msg:content instead.")
  (content m))

(cl:ensure-generic-function 'seqID-val :lambda-list '(m))
(cl:defmethod seqID-val ((m <string_ID>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja01-msg:seqID-val is deprecated.  Use vaja01-msg:seqID instead.")
  (seqID m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <string_ID>) ostream)
  "Serializes a message object of type '<string_ID>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'content))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'content))
  (cl:let* ((signed (cl:slot-value msg 'seqID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <string_ID>) istream)
  "Deserializes a message object of type '<string_ID>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'content) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'content) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'seqID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<string_ID>)))
  "Returns string type for a message object of type '<string_ID>"
  "vaja01/string_ID")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'string_ID)))
  "Returns string type for a message object of type 'string_ID"
  "vaja01/string_ID")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<string_ID>)))
  "Returns md5sum for a message object of type '<string_ID>"
  "b57dc76242a9a2500d39577844d88d65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'string_ID)))
  "Returns md5sum for a message object of type 'string_ID"
  "b57dc76242a9a2500d39577844d88d65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<string_ID>)))
  "Returns full string definition for message of type '<string_ID>"
  (cl:format cl:nil "string content~%int32 seqID~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'string_ID)))
  "Returns full string definition for message of type 'string_ID"
  (cl:format cl:nil "string content~%int32 seqID~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <string_ID>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'content))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <string_ID>))
  "Converts a ROS message object to a list"
  (cl:list 'string_ID
    (cl:cons ':content (content msg))
    (cl:cons ':seqID (seqID msg))
))
