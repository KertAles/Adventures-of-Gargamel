
(cl:in-package :asdf)

(defsystem "exercise4-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Person" :depends-on ("_package_Person"))
    (:file "_package_Person" :depends-on ("_package"))
    (:file "turtle_pos" :depends-on ("_package_turtle_pos"))
    (:file "_package_turtle_pos" :depends-on ("_package"))
  ))