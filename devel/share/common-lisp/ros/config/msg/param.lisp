; Auto-generated. Do not edit!


(cl:in-package config-msg)


;//! \htmlinclude param.msg.html

(cl:defclass <param> (roslisp-msg-protocol:ros-message)
  ((exposure
    :reader exposure
    :initarg :exposure
    :type cl:integer
    :initform 0))
)

(cl:defclass param (<param>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <param>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'param)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config-msg:<param> is deprecated: use config-msg:param instead.")))

(cl:ensure-generic-function 'exposure-val :lambda-list '(m))
(cl:defmethod exposure-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:exposure-val is deprecated.  Use config-msg:exposure instead.")
  (exposure m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <param>) ostream)
  "Serializes a message object of type '<param>"
  (cl:let* ((signed (cl:slot-value msg 'exposure)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <param>) istream)
  "Deserializes a message object of type '<param>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'exposure) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<param>)))
  "Returns string type for a message object of type '<param>"
  "config/param")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'param)))
  "Returns string type for a message object of type 'param"
  "config/param")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<param>)))
  "Returns md5sum for a message object of type '<param>"
  "0535ed1a1204bb999d0e7bea8f6c3c81")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'param)))
  "Returns md5sum for a message object of type 'param"
  "0535ed1a1204bb999d0e7bea8f6c3c81")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<param>)))
  "Returns full string definition for message of type '<param>"
  (cl:format cl:nil "int32 exposure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'param)))
  "Returns full string definition for message of type 'param"
  (cl:format cl:nil "int32 exposure~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <param>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <param>))
  "Converts a ROS message object to a list"
  (cl:list 'param
    (cl:cons ':exposure (exposure msg))
))
