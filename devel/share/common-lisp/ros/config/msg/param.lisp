; Auto-generated. Do not edit!


(cl:in-package config-msg)


;//! \htmlinclude param.msg.html

(cl:defclass <param> (roslisp-msg-protocol:ros-message)
  ((NMS_THRESH
    :reader NMS_THRESH
    :initarg :NMS_THRESH
    :type cl:float
    :initform 0.0)
   (CONF_THRESH
    :reader CONF_THRESH
    :initarg :CONF_THRESH
    :type cl:float
    :initform 0.0))
)

(cl:defclass param (<param>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <param>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'param)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name config-msg:<param> is deprecated: use config-msg:param instead.")))

(cl:ensure-generic-function 'NMS_THRESH-val :lambda-list '(m))
(cl:defmethod NMS_THRESH-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:NMS_THRESH-val is deprecated.  Use config-msg:NMS_THRESH instead.")
  (NMS_THRESH m))

(cl:ensure-generic-function 'CONF_THRESH-val :lambda-list '(m))
(cl:defmethod CONF_THRESH-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:CONF_THRESH-val is deprecated.  Use config-msg:CONF_THRESH instead.")
  (CONF_THRESH m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <param>) ostream)
  "Serializes a message object of type '<param>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'NMS_THRESH))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CONF_THRESH))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <param>) istream)
  "Deserializes a message object of type '<param>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'NMS_THRESH) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CONF_THRESH) (roslisp-utils:decode-single-float-bits bits)))
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
  "a0b1b6f3d3665bfdff09071fd56959d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'param)))
  "Returns md5sum for a message object of type 'param"
  "a0b1b6f3d3665bfdff09071fd56959d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<param>)))
  "Returns full string definition for message of type '<param>"
  (cl:format cl:nil "float32 NMS_THRESH~%float32 CONF_THRESH~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'param)))
  "Returns full string definition for message of type 'param"
  (cl:format cl:nil "float32 NMS_THRESH~%float32 CONF_THRESH~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <param>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <param>))
  "Converts a ROS message object to a list"
  (cl:list 'param
    (cl:cons ':NMS_THRESH (NMS_THRESH msg))
    (cl:cons ':CONF_THRESH (CONF_THRESH msg))
))
