
(cl:in-package :asdf)

(defsystem "vaja01-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ArrayOfInts" :depends-on ("_package_ArrayOfInts"))
    (:file "_package_ArrayOfInts" :depends-on ("_package"))
  ))