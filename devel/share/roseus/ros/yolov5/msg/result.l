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
  :slots (_x _distance ))

(defmethod yolov5::result
  (:init
   (&key
    ((:x __x) 0)
    ((:distance __distance) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _distance (round __distance))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; int32 _x
    4
    ;; int32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _x
       (write-long _x s)
     ;; int32 _distance
       (write-long _distance s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _distance
     (setq _distance (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolov5::result :md5sum-) "868f6f96866e086832cb94501f599dc0")
(setf (get yolov5::result :datatype-) "yolov5/result")
(setf (get yolov5::result :definition-)
      "int32 x
int32 distance
")



(provide :yolov5/result "868f6f96866e086832cb94501f599dc0")


