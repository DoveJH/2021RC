;; Auto-generated. Do not edit!


(when (boundp 'yolov5::result)
  (if (not (find-package "YOLOV5"))
    (make-package "YOLOV5"))
  (shadow 'result (find-package "YOLOV5")))
(unless (find-package "YOLOV5::RESULT")
  (make-package "YOLOV5::RESULT"))

(in-package "ROS")
;;//! \htmlinclude result.msg.html


(defclass yolov5::result
  :super ros::object
  :slots (_bbox0 _bbox1 _bbox2 _bbox3 _conf _class_id ))

(defmethod yolov5::result
  (:init
   (&key
    ((:bbox0 __bbox0) 0.0)
    ((:bbox1 __bbox1) 0.0)
    ((:bbox2 __bbox2) 0.0)
    ((:bbox3 __bbox3) 0.0)
    ((:conf __conf) 0.0)
    ((:class_id __class_id) 0.0)
    )
   (send-super :init)
   (setq _bbox0 (float __bbox0))
   (setq _bbox1 (float __bbox1))
   (setq _bbox2 (float __bbox2))
   (setq _bbox3 (float __bbox3))
   (setq _conf (float __conf))
   (setq _class_id (float __class_id))
   self)
  (:bbox0
   (&optional __bbox0)
   (if __bbox0 (setq _bbox0 __bbox0)) _bbox0)
  (:bbox1
   (&optional __bbox1)
   (if __bbox1 (setq _bbox1 __bbox1)) _bbox1)
  (:bbox2
   (&optional __bbox2)
   (if __bbox2 (setq _bbox2 __bbox2)) _bbox2)
  (:bbox3
   (&optional __bbox3)
   (if __bbox3 (setq _bbox3 __bbox3)) _bbox3)
  (:conf
   (&optional __conf)
   (if __conf (setq _conf __conf)) _conf)
  (:class_id
   (&optional __class_id)
   (if __class_id (setq _class_id __class_id)) _class_id)
  (:serialization-length
   ()
   (+
    ;; float32 _bbox0
    4
    ;; float32 _bbox1
    4
    ;; float32 _bbox2
    4
    ;; float32 _bbox3
    4
    ;; float32 _conf
    4
    ;; float32 _class_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _bbox0
       (sys::poke _bbox0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bbox1
       (sys::poke _bbox1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bbox2
       (sys::poke _bbox2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bbox3
       (sys::poke _bbox3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _conf
       (sys::poke _conf (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _class_id
       (sys::poke _class_id (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _bbox0
     (setq _bbox0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bbox1
     (setq _bbox1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bbox2
     (setq _bbox2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bbox3
     (setq _bbox3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _conf
     (setq _conf (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _class_id
     (setq _class_id (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolov5::result :md5sum-) "043d72adf347ac3893fd75771296e418")
(setf (get yolov5::result :datatype-) "yolov5/result")
(setf (get yolov5::result :definition-)
      "float32 bbox0
float32 bbox1
float32 bbox2
float32 bbox3
float32 conf
float32 class_id
")



(provide :yolov5/result "043d72adf347ac3893fd75771296e418")


