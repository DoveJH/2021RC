;; Auto-generated. Do not edit!


(when (boundp 'config::param)
  (if (not (find-package "CONFIG"))
    (make-package "CONFIG"))
  (shadow 'param (find-package "CONFIG")))
(unless (find-package "CONFIG::PARAM")
  (make-package "CONFIG::PARAM"))

(in-package "ROS")
;;//! \htmlinclude param.msg.html


(defclass config::param
  :super ros::object
  :slots (_NMS_THRESH _CONF_THRESH ))

(defmethod config::param
  (:init
   (&key
    ((:NMS_THRESH __NMS_THRESH) 0.0)
    ((:CONF_THRESH __CONF_THRESH) 0.0)
    )
   (send-super :init)
   (setq _NMS_THRESH (float __NMS_THRESH))
   (setq _CONF_THRESH (float __CONF_THRESH))
   self)
  (:NMS_THRESH
   (&optional __NMS_THRESH)
   (if __NMS_THRESH (setq _NMS_THRESH __NMS_THRESH)) _NMS_THRESH)
  (:CONF_THRESH
   (&optional __CONF_THRESH)
   (if __CONF_THRESH (setq _CONF_THRESH __CONF_THRESH)) _CONF_THRESH)
  (:serialization-length
   ()
   (+
    ;; float32 _NMS_THRESH
    4
    ;; float32 _CONF_THRESH
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _NMS_THRESH
       (sys::poke _NMS_THRESH (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CONF_THRESH
       (sys::poke _CONF_THRESH (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _NMS_THRESH
     (setq _NMS_THRESH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CONF_THRESH
     (setq _CONF_THRESH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get config::param :md5sum-) "a0b1b6f3d3665bfdff09071fd56959d6")
(setf (get config::param :datatype-) "config/param")
(setf (get config::param :definition-)
      "float32 NMS_THRESH
float32 CONF_THRESH

")



(provide :config/param "a0b1b6f3d3665bfdff09071fd56959d6")


