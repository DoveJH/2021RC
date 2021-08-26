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
  :slots (_NMS_THRESH _CONF_THRESH _k_volleyball _k_basketball _k_basket _k_mark _if_shot _if_show _k_x0 _k_y0 _k_z0 _k_x1 _k_y1 _k_z1 _k_test ))

(defmethod config::param
  (:init
   (&key
    ((:NMS_THRESH __NMS_THRESH) 0.0)
    ((:CONF_THRESH __CONF_THRESH) 0.0)
    ((:k_volleyball __k_volleyball) 0)
    ((:k_basketball __k_basketball) 0.0)
    ((:k_basket __k_basket) 0)
    ((:k_mark __k_mark) 0)
    ((:if_shot __if_shot) nil)
    ((:if_show __if_show) nil)
    ((:k_x0 __k_x0) 0.0)
    ((:k_y0 __k_y0) 0.0)
    ((:k_z0 __k_z0) 0.0)
    ((:k_x1 __k_x1) 0.0)
    ((:k_y1 __k_y1) 0.0)
    ((:k_z1 __k_z1) 0.0)
    ((:k_test __k_test) 0.0)
    )
   (send-super :init)
   (setq _NMS_THRESH (float __NMS_THRESH))
   (setq _CONF_THRESH (float __CONF_THRESH))
   (setq _k_volleyball (round __k_volleyball))
   (setq _k_basketball (float __k_basketball))
   (setq _k_basket (round __k_basket))
   (setq _k_mark (round __k_mark))
   (setq _if_shot __if_shot)
   (setq _if_show __if_show)
   (setq _k_x0 (float __k_x0))
   (setq _k_y0 (float __k_y0))
   (setq _k_z0 (float __k_z0))
   (setq _k_x1 (float __k_x1))
   (setq _k_y1 (float __k_y1))
   (setq _k_z1 (float __k_z1))
   (setq _k_test (float __k_test))
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
  (:k_test
   (&optional __k_test)
   (if __k_test (setq _k_test __k_test)) _k_test)
  (:serialization-length
   ()
   (+
    ;; float32 _NMS_THRESH
    4
    ;; float32 _CONF_THRESH
    4
    ;; int32 _k_volleyball
    4
    ;; float64 _k_basketball
    8
    ;; int32 _k_basket
    4
    ;; int32 _k_mark
    4
    ;; bool _if_shot
    1
    ;; bool _if_show
    1
    ;; float64 _k_x0
    8
    ;; float64 _k_y0
    8
    ;; float64 _k_z0
    8
    ;; float64 _k_x1
    8
    ;; float64 _k_y1
    8
    ;; float64 _k_z1
    8
    ;; float64 _k_test
    8
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
     ;; float64 _k_basketball
       (sys::poke _k_basketball (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32 _k_basket
       (write-long _k_basket s)
     ;; int32 _k_mark
       (write-long _k_mark s)
     ;; bool _if_shot
       (if _if_shot (write-byte -1 s) (write-byte 0 s))
     ;; bool _if_show
       (if _if_show (write-byte -1 s) (write-byte 0 s))
     ;; float64 _k_x0
       (sys::poke _k_x0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_y0
       (sys::poke _k_y0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_z0
       (sys::poke _k_z0 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_x1
       (sys::poke _k_x1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_y1
       (sys::poke _k_y1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_z1
       (sys::poke _k_z1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_test
       (sys::poke _k_test (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _k_basketball
     (setq _k_basketball (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32 _k_basket
     (setq _k_basket (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _k_mark
     (setq _k_mark (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _if_shot
     (setq _if_shot (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _if_show
     (setq _if_show (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _k_x0
     (setq _k_x0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_y0
     (setq _k_y0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_z0
     (setq _k_z0 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_x1
     (setq _k_x1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_y1
     (setq _k_y1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_z1
     (setq _k_z1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_test
     (setq _k_test (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get config::param :md5sum-) "eb5de5e5d2fd7f2c45fa5a927466753a")
(setf (get config::param :datatype-) "config/param")
(setf (get config::param :definition-)
      "float32 NMS_THRESH
float32 CONF_THRESH
int32 k_volleyball
float64 k_basketball
int32 k_basket
int32 k_mark
bool if_shot
bool if_show
float64 k_x0
float64 k_y0
float64 k_z0
float64 k_x1
float64 k_y1
float64 k_z1
float64 k_test
")



(provide :config/param "eb5de5e5d2fd7f2c45fa5a927466753a")


