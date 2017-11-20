;;;; random-svg.asd

(asdf:defsystem #:random-svg
  :description "Describe random-svg here"
  :author "Alejandro Zamora Fonseca"
  :license "GNU GPLv3"
  :serial t
  :components ((:file "package")
               (:file "random-svg"))
  :depends-on ("cl-who" "cl-svg"))
