;;;; random-svg.lisp

(in-package #:random-svg)

;;; "random-svg" goes here. Hacks and glory await!


(defparameter *svg* *standard-output*)

(setf cl-who:*html-empty-tags* (append cl-who:*html-empty-tags* '(:circle :line)))


(defmacro with-svg (&body body)
  `(progn
     (format *svg* "<?xml version=\"1.0\" standalone=\"yes\"?>~%~%")
     (who:with-html-output
         (*svg* nil :prologue
                "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">"
                :indent T)
       ,@body)))

(defmacro create-svg (filename &body svg-body)
  `(with-open-file (*svg* ,filename :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
     (with-svg
       (:svg :width "4in" :height "3in" :version "1.1"
             :xmlns "http://www.w3.org/2000/svg" :|xmlns:xlink| "http://www.w3.org/1999/xlink"
             (:desc "This graphic links to an external image")

             ,@svg-body))))

;; Example
;; (create-svg "out.svg"
;;   (:g :id "whiskers"
;;       (:line :x1 "57" :y1 "95" :x2 "135" :y2 "85" :style "stroke: black;")
;;       (:line :x1 "57" :y1 "95" :x2 "135" :y2 "105" :style "stroke: black;"))
;;   (:circle :cx "70" :cy "50" :r "50" :style "stroke: black; fill: red"))
