
(cl:in-package :asdf)

(defsystem "config-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "param" :depends-on ("_package_param"))
    (:file "_package_param" :depends-on ("_package"))
  ))