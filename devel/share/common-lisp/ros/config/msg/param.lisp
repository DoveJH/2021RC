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
    :initform 0.0)
   (k_volleyball
    :reader k_volleyball
    :initarg :k_volleyball
    :type cl:integer
    :initform 0)
   (k_basketball
    :reader k_basketball
    :initarg :k_basketball
    :type cl:integer
    :initform 0)
   (k_basket
    :reader k_basket
    :initarg :k_basket
    :type cl:integer
    :initform 0)
   (k_mark
    :reader k_mark
    :initarg :k_mark
    :type cl:integer
    :initform 0)
   (if_shot
    :reader if_shot
    :initarg :if_shot
    :type cl:boolean
    :initform cl:nil))
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

(cl:ensure-generic-function 'k_volleyball-val :lambda-list '(m))
(cl:defmethod k_volleyball-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:k_volleyball-val is deprecated.  Use config-msg:k_volleyball instead.")
  (k_volleyball m))

(cl:ensure-generic-function 'k_basketball-val :lambda-list '(m))
(cl:defmethod k_basketball-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:k_basketball-val is deprecated.  Use config-msg:k_basketball instead.")
  (k_basketball m))

(cl:ensure-generic-function 'k_basket-val :lambda-list '(m))
(cl:defmethod k_basket-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:k_basket-val is deprecated.  Use config-msg:k_basket instead.")
  (k_basket m))

(cl:ensure-generic-function 'k_mark-val :lambda-list '(m))
(cl:defmethod k_mark-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:k_mark-val is deprecated.  Use config-msg:k_mark instead.")
  (k_mark m))

(cl:ensure-generic-function 'if_shot-val :lambda-list '(m))
(cl:defmethod if_shot-val ((m <param>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader config-msg:if_shot-val is deprecated.  Use config-msg:if_shot instead.")
  (if_shot m))
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
  (cl:let* ((signed (cl:slot-value msg 'k_volleyball)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'k_basketball)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'k_basket)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'k_mark)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'if_shot) 1 0)) ostream)
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'k_volleyball) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'k_basketball) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'k_basket) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'k_mark) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'if_shot) (cl:not (cl:zerop (cl:read-byte istream))))
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
  "c4f32d994079a3a9434ca3b64f8b4020")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'param)))
  "Returns md5sum for a message object of type 'param"
  "c4f32d994079a3a9434ca3b64f8b4020")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<param>)))
  "Returns full string definition for message of type '<param>"
  (cl:format cl:nil "float32 NMS_THRESH~%float32 CONF_THRESH~%int32 k_volleyball~%int32 k_basketball~%int32 k_basket~%int32 k_mark~%bool if_shot~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'param)))
  "Returns full string definition for message of type 'param"
  (cl:format cl:nil "float32 NMS_THRESH~%float32 CONF_THRESH~%int32 k_volleyball~%int32 k_basketball~%int32 k_basket~%int32 k_mark~%bool if_shot~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <param>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <param>))
  "Converts a ROS message object to a list"
  (cl:list 'param
    (cl:cons ':NMS_THRESH (NMS_THRESH msg))
    (cl:cons ':CONF_THRESH (CONF_THRESH msg))
    (cl:cons ':k_volleyball (k_volleyball msg))
    (cl:cons ':k_basketball (k_basketball msg))
    (cl:cons ':k_basket (k_basket msg))
    (cl:cons ':k_mark (k_mark msg))
    (cl:cons ':if_shot (if_shot msg))
))
