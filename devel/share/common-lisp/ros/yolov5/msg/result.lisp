; Auto-generated. Do not edit!


(cl:in-package yolov5-msg)


;//! \htmlinclude result.msg.html

(cl:defclass <result> (roslisp-msg-protocol:ros-message)
  ((bbox0
    :reader bbox0
    :initarg :bbox0
    :type cl:float
    :initform 0.0)
   (bbox1
    :reader bbox1
    :initarg :bbox1
    :type cl:float
    :initform 0.0)
   (bbox2
    :reader bbox2
    :initarg :bbox2
    :type cl:float
    :initform 0.0)
   (bbox3
    :reader bbox3
    :initarg :bbox3
    :type cl:float
    :initform 0.0)
   (conf
    :reader conf
    :initarg :conf
    :type cl:float
    :initform 0.0)
   (class_id
    :reader class_id
    :initarg :class_id
    :type cl:float
    :initform 0.0))
)

(cl:defclass result (<result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolov5-msg:<result> is deprecated: use yolov5-msg:result instead.")))

(cl:ensure-generic-function 'bbox0-val :lambda-list '(m))
(cl:defmethod bbox0-val ((m <result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5-msg:bbox0-val is deprecated.  Use yolov5-msg:bbox0 instead.")
  (bbox0 m))

(cl:ensure-generic-function 'bbox1-val :lambda-list '(m))
(cl:defmethod bbox1-val ((m <result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5-msg:bbox1-val is deprecated.  Use yolov5-msg:bbox1 instead.")
  (bbox1 m))

(cl:ensure-generic-function 'bbox2-val :lambda-list '(m))
(cl:defmethod bbox2-val ((m <result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5-msg:bbox2-val is deprecated.  Use yolov5-msg:bbox2 instead.")
  (bbox2 m))

(cl:ensure-generic-function 'bbox3-val :lambda-list '(m))
(cl:defmethod bbox3-val ((m <result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5-msg:bbox3-val is deprecated.  Use yolov5-msg:bbox3 instead.")
  (bbox3 m))

(cl:ensure-generic-function 'conf-val :lambda-list '(m))
(cl:defmethod conf-val ((m <result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5-msg:conf-val is deprecated.  Use yolov5-msg:conf instead.")
  (conf m))

(cl:ensure-generic-function 'class_id-val :lambda-list '(m))
(cl:defmethod class_id-val ((m <result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolov5-msg:class_id-val is deprecated.  Use yolov5-msg:class_id instead.")
  (class_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <result>) ostream)
  "Serializes a message object of type '<result>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bbox0))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bbox1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bbox2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'bbox3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'class_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <result>) istream)
  "Deserializes a message object of type '<result>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bbox0) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bbox1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bbox2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'bbox3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'conf) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'class_id) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<result>)))
  "Returns string type for a message object of type '<result>"
  "yolov5/result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'result)))
  "Returns string type for a message object of type 'result"
  "yolov5/result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<result>)))
  "Returns md5sum for a message object of type '<result>"
  "043d72adf347ac3893fd75771296e418")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'result)))
  "Returns md5sum for a message object of type 'result"
  "043d72adf347ac3893fd75771296e418")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<result>)))
  "Returns full string definition for message of type '<result>"
  (cl:format cl:nil "float32 bbox0~%float32 bbox1~%float32 bbox2~%float32 bbox3~%float32 conf~%float32 class_id~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'result)))
  "Returns full string definition for message of type 'result"
  (cl:format cl:nil "float32 bbox0~%float32 bbox1~%float32 bbox2~%float32 bbox3~%float32 conf~%float32 class_id~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <result>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <result>))
  "Converts a ROS message object to a list"
  (cl:list 'result
    (cl:cons ':bbox0 (bbox0 msg))
    (cl:cons ':bbox1 (bbox1 msg))
    (cl:cons ':bbox2 (bbox2 msg))
    (cl:cons ':bbox3 (bbox3 msg))
    (cl:cons ':conf (conf msg))
    (cl:cons ':class_id (class_id msg))
))
