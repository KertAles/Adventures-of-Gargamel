
(cl:in-package :asdf)

(defsystem "exercise6-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :visualization_msgs-msg
)
  :components ((:file "_package")
    (:file "Cylinder" :depends-on ("_package_Cylinder"))
    (:file "_package_Cylinder" :depends-on ("_package"))
    (:file "Cylinder_sensor" :depends-on ("_package_Cylinder_sensor"))
    (:file "_package_Cylinder_sensor" :depends-on ("_package"))
    (:file "Ring" :depends-on ("_package_Ring"))
    (:file "_package_Ring" :depends-on ("_package"))
  ))