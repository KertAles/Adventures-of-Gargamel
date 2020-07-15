; Auto-generated. Do not edit!


(cl:in-package vaja01-srv)


;//! \htmlinclude ArrayOfInts-request.msg.html

(cl:defclass <ArrayOfInts-request> (roslisp-msg-protocol:ros-message)
  ((vrsta
    :reader vrsta
    :initarg :vrsta
    :type (cl:vector cl:integer)
   :initform (cl:make-array 10 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass ArrayOfInts-request (<ArrayOfInts-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArrayOfInts-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArrayOfInts-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vaja01-srv:<ArrayOfInts-request> is deprecated: use vaja01-srv:ArrayOfInts-request instead.")))

(cl:ensure-generic-function 'vrsta-val :lambda-list '(m))
(cl:defmethod vrsta-val ((m <ArrayOfInts-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja01-srv:vrsta-val is deprecated.  Use vaja01-srv:vrsta instead.")
  (vrsta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArrayOfInts-request>) ostream)
  "Serializes a message object of type '<ArrayOfInts-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    ))
   (cl:slot-value msg 'vrsta))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArrayOfInts-request>) istream)
  "Deserializes a message object of type '<ArrayOfInts-request>"
  (cl:setf (cl:slot-value msg 'vrsta) (cl:make-array 10))
  (cl:let ((vals (cl:slot-value msg 'vrsta)))
    (cl:dotimes (i 10)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArrayOfInts-request>)))
  "Returns string type for a service object of type '<ArrayOfInts-request>"
  "vaja01/ArrayOfIntsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArrayOfInts-request)))
  "Returns string type for a service object of type 'ArrayOfInts-request"
  "vaja01/ArrayOfIntsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArrayOfInts-request>)))
  "Returns md5sum for a message object of type '<ArrayOfInts-request>"
  "9f68a5f63056c0474865224eaf043dcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArrayOfInts-request)))
  "Returns md5sum for a message object of type 'ArrayOfInts-request"
  "9f68a5f63056c0474865224eaf043dcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArrayOfInts-request>)))
  "Returns full string definition for message of type '<ArrayOfInts-request>"
  (cl:format cl:nil "int64[10] vrsta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArrayOfInts-request)))
  "Returns full string definition for message of type 'ArrayOfInts-request"
  (cl:format cl:nil "int64[10] vrsta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArrayOfInts-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'vrsta) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArrayOfInts-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ArrayOfInts-request
    (cl:cons ':vrsta (vrsta msg))
))
;//! \htmlinclude ArrayOfInts-response.msg.html

(cl:defclass <ArrayOfInts-response> (roslisp-msg-protocol:ros-message)
  ((vsota
    :reader vsota
    :initarg :vsota
    :type cl:integer
    :initform 0))
)

(cl:defclass ArrayOfInts-response (<ArrayOfInts-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArrayOfInts-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArrayOfInts-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vaja01-srv:<ArrayOfInts-response> is deprecated: use vaja01-srv:ArrayOfInts-response instead.")))

(cl:ensure-generic-function 'vsota-val :lambda-list '(m))
(cl:defmethod vsota-val ((m <ArrayOfInts-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vaja01-srv:vsota-val is deprecated.  Use vaja01-srv:vsota instead.")
  (vsota m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArrayOfInts-response>) ostream)
  "Serializes a message object of type '<ArrayOfInts-response>"
  (cl:let* ((signed (cl:slot-value msg 'vsota)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArrayOfInts-response>) istream)
  "Deserializes a message object of type '<ArrayOfInts-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vsota) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArrayOfInts-response>)))
  "Returns string type for a service object of type '<ArrayOfInts-response>"
  "vaja01/ArrayOfIntsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArrayOfInts-response)))
  "Returns string type for a service object of type 'ArrayOfInts-response"
  "vaja01/ArrayOfIntsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArrayOfInts-response>)))
  "Returns md5sum for a message object of type '<ArrayOfInts-response>"
  "9f68a5f63056c0474865224eaf043dcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArrayOfInts-response)))
  "Returns md5sum for a message object of type 'ArrayOfInts-response"
  "9f68a5f63056c0474865224eaf043dcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArrayOfInts-response>)))
  "Returns full string definition for message of type '<ArrayOfInts-response>"
  (cl:format cl:nil "int64 vsota~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArrayOfInts-response)))
  "Returns full string definition for message of type 'ArrayOfInts-response"
  (cl:format cl:nil "int64 vsota~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArrayOfInts-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArrayOfInts-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ArrayOfInts-response
    (cl:cons ':vsota (vsota msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ArrayOfInts)))
  'ArrayOfInts-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ArrayOfInts)))
  'ArrayOfInts-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArrayOfInts)))
  "Returns string type for a service object of type '<ArrayOfInts>"
  "vaja01/ArrayOfInts")