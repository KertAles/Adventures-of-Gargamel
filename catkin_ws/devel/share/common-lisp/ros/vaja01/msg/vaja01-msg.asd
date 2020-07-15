
(cl:in-package :asdf)

(defsystem "vaja01-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "string_ID" :depends-on ("_package_string_ID"))
    (:file "_package_string_ID" :depends-on ("_package"))
  ))