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
  :slots (_NMS_THRESH _CONF_THRESH _if_shot _if_show _k_x0 _k_y0 _k_z0 _k_x1 _k_y1 _k_z1 ))

(defmethod config::param
  (:init
   (&key
    ((:NMS_THRESH __NMS_THRESH) 0.0)
    ((:CONF_THRESH __CONF_THRESH) 0.0)
    ((:if_shot __if_shot) nil)
    ((:if_show __if_show) nil)
    ((:k_x0 __k_x0) 0)
    ((:k_y0 __k_y0) 0)
    ((:k_z0 __k_z0) 0)
    ((:k_x1 __k_x1) 0)
    ((:k_y1 __k_y1) 0)
    ((:k_z1 __k_z1) 0)
    )
   (send-super :init)
   (setq _NMS_THRESH (float __NMS_THRESH))
   (setq _CONF_THRESH (float __CONF_THRESH))
   (setq _if_shot __if_shot)
   (setq _if_show __if_show)
   (setq _k_x0 (round __k_x0))
   (setq _k_y0 (round __k_y0))
   (setq _k_z0 (round __k_z0))
   (setq _k_x1 (round __k_x1))
   (setq _k_y1 (round __k_y1))
   (setq _k_z1 (round __k_z1))
   self)
  (:NMS_THRESH
   (&optional __NMS_THRESH)
   (if __NMS_THRESH (setq _NMS_THRESH __NMS_THRESH)) _NMS_THRESH)
  (:CONF_THRESH
   (&optional __CONF_THRESH)
   (if __CONF_THRESH (setq _CONF_THRESH __CONF_THRESH)) _CONF_THRESH)
  (:if_shot
   (&optional __if_shot)
   (if __if_shot (setq _if_shot __if_shot)) _if_shot)
  (:if_show
   (&optional __if_show)
   (if __if_show (setq _if_show __if_show)) _if_show)
  (:k_x0
   (&optional __k_x0)
   (if __k_x0 (setq _k_x0 __k_x0)) _k_x0)
  (:k_y0
   (&optional __k_y0)
   (if __k_y0 (setq _k_y0 __k_y0)) _k_y0)
  (:k_z0
   (&optional __k_z0)
   (if __k_z0 (setq _k_z0 __k_z0)) _k_z0)
  (:k_x1
   (&optional __k_x1)
   (if __k_x1 (setq _k_x1 __k_x1)) _k_x1)
  (:k_y1
   (&optional __k_y1)
   (if __k_y1 (setq _k_y1 __k_y1)) _k_y1)
  (:k_z1
   (&optional __k_z1)
   (if __k_z1 (setq _k_z1 __k_z1)) _k_z1)
  (:serialization-length
   ()
   (+
    ;; float32 _NMS_THRESH
    4
    ;; float32 _CONF_THRESH
    4
    ;; bool _if_shot
    1
    ;; bool _if_show
    1
    ;; int32 _k_x0
    4
    ;; int32 _k_y0
    4
    ;; int32 _k_z0
    4
    ;; int32 _k_x1
    4
    ;; int32 _k_y1
    4
    ;; int32 _k_z1
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
     ;; bool _if_shot
       (if _if_shot (write-byte -1 s) (write-byte 0 s))
     ;; bool _if_show
       (if _if_show (write-byte -1 s) (write-byte 0 s))
     ;; int32 _k_x0
       (write-long _k_x0 s)
     ;; int32 _k_y0
       (write-long _k_y0 s)
     ;; int32 _k_z0
       (write-long _k_z0 s)
     ;; int32 _k_x1
       (write-long _k_x1 s)
     ;; int32 _k_y1
       (write-long _k_y1 s)
     ;; int32 _k_z1
       (write-long _k_z1 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _NMS_THRESH
     (setq _NMS_THRESH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CONF_THRESH
     (setq _CONF_THRESH (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _if_shot
     (setq _if_shot (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _if_show
     (setq _if_show (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _k_x0
     (setq _k_x0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_y0
     (setq _k_y0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_z0
     (setq _k_z0 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_x1
     (setq _k_x1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_y1
     (setq _k_y1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_z1
     (setq _k_z1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get config::param :md5sum-) "1411ae11535e1135c0228980116d734a")
(setf (get config::param :datatype-) "config/param")
(setf (get config::param :definition-)
      "float32 NMS_THRESH
float32 CONF_THRESH
bool if_shot
bool if_show
int32 k_x0
int32 k_y0
int32 k_z0
int32 k_x1
int32 k_y1
int32 k_z1
")



(provide :config/param "1411ae11535e1135c0228980116d734a")


