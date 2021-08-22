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
  :slots ())

(defmethod yolov5::result
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get yolov5::result :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get yolov5::result :datatype-) "yolov5/result")
(setf (get yolov5::result :definition-)
      "
")



(provide :yolov5/result "d41d8cd98f00b204e9800998ecf8427e")


