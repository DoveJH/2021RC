
(cl:in-package :asdf)

(defsystem "yolov5-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "result" :depends-on ("_package_result"))
    (:file "_package_result" :depends-on ("_package"))
  ))