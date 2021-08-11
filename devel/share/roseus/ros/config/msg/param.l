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
  :slots (_exposure ))

(defmethod config::param
  (:init
   (&key
    ((:exposure __exposure) 0)
    )
   (send-super :init)
   (setq _exposure (round __exposure))
   self)
  (:exposure
   (&optional __exposure)
   (if __exposure (setq _exposure __exposure)) _exposure)
  (:serialization-length
   ()
   (+
    ;; int32 _exposure
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _exposure
       (write-long _exposure s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _exposure
     (setq _exposure (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get config::param :md5sum-) "0535ed1a1204bb999d0e7bea8f6c3c81")
(setf (get config::param :datatype-) "config/param")
(setf (get config::param :definition-)
      "int32 exposure

")



(provide :config/param "0535ed1a1204bb999d0e7bea8f6c3c81")


