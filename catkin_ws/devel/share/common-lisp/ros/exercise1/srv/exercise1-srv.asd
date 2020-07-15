
(cl:in-package :asdf)

(defsystem "exercise1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AddTwoInts" :depends-on ("_package_AddTwoInts"))
    (:file "_package_AddTwoInts" :depends-on ("_package"))
    (:file "Reverse" :depends-on ("_package_Reverse"))
    (:file "_package_Reverse" :depends-on ("_package"))
  ))