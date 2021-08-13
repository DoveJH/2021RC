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
  :slots (_NMS_THRESH _CONF_THRESH _k_volleyball _k_basketball _k_basket _k_mark _if_shot ))

(defmethod config::param
  (:init
   (&key
    ((:NMS_THRESH __NMS_THRESH) 0.0)
    ((:CONF_THRESH __CONF_THRESH) 0.0)
    ((:k_volleyball __k_volleyball) 0)
    ((:k_basketball __k_basketball) 0)
    ((:k_basket __k_basket) 0)
    ((:k_mark __k_mark) 0)
    ((:if_shot __if_shot) nil)
    )
   (send-super :init)
   (setq _NMS_THRESH (float __NMS_THRESH))
   (setq _CONF_THRESH (float __CONF_THRESH))
   (setq _k_volleyball (round __k_volleyball))
   (setq _k_basketball (round __k_basketball))
   (setq _k_basket (round __k_basket))
   (setq _k_mark (round __k_mark))
   (setq _if_shot __if_shot)
   self)
  (:NMS_THRESH
   (&optional __NMS_THRESH)
   (if __NMS_THRESH (setq _NMS_THRESH __NMS_THRESH)) _NMS_THRESH)
  (:CONF_THRESH
   (&optional __CONF_THRESH)
   (if __CONF_THRESH (setq _CONF_THRESH __CONF_THRESH)) _CONF_THRESH)
  (:k_volleyball
   (&optional __k_volleyball)
   (if __k_volleyball (setq _k_volleyball __k_volleyball)) _k_volleyball)
  (:k_basketball
   (&optional __k_basketball)
   (if __k_basketball (setq _k_basketball __k_basketball)) _k_basketball)
  (:k_basket
   (&optional __k_basket)
   (if __k_basket (setq _k_basket __k_basket)) _k_basket)
  (:k_mark
   (&optional __k_mark)
   (if __k_mark (setq _k_mark __k_mark)) _k_mark)
  (:if_shot
   (&optional __if_shot)
   (if __if_shot (setq _if_shot __if_shot)) _if_shot)
  (:serialization-length
   ()
   (+
    ;; float32 _NMS_THRESH
    4
    ;; float32 _CONF_THRESH
    4
    ;; int32 _k_volleyball
    4
    ;; int32 _k_basketball
    4
    ;; int32 _k_basket
    4
    ;; int32 _k_mark
    4
    ;; bool _if_shot
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _NMS_THRESH
       (sys::poke _NMS_THRESH (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CONF_THRESH
       (sys::poke _CONF_THRESH (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _k_volleyball
       (write-long _k_volleyball s)
     ;; int32 _k_basketball
       (write-long _k_basketball s)
     ;; int32 _k_basket
       (write-long _k_basket s)
     ;; int32 _k_mark
       (write-long _k_mark s)
     ;; bool _if_shot
       (if _if_shot (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _NMS_THRESH
     (setq _NMS_THRESH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CONF_THRESH
     (setq _CONF_THRESH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _k_volleyball
     (setq _k_volleyball (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_basketball
     (setq _k_basketball (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_basket
     (setq _k_basket (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_mark
     (setq _k_mark (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _if_shot
     (setq _if_shot (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get config::param :md5sum-) "c4f32d994079a3a9434ca3b64f8b4020")
(setf (get config::param :datatype-) "config/param")
(setf (get config::param :definition-)
      "float32 NMS_THRESH
float32 CONF_THRESH
int32 k_volleyball
int32 k_basketball
int32 k_basket
int32 k_mark
bool if_shot
")



(provide :config/param "c4f32d994079a3a9434ca3b64f8b4020")


