;;;; package.lisp

(defpackage #:chapter2
  (:use #:cl)
  (:export 
    :exercise-one-main  ; You need to export functions if you want to be able to call libraries from
    :exercise-two-main  ; other places you are writing code
    :exercise-three-main
  )
)

(in-package #:chapter2)
