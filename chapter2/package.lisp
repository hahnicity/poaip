;;;; package.lisp

(defpackage #:chapter2
  (:use #:cl)
  (:export 
    :main  ; You need to export functions if you want to be able to call libraries from
           ; other places you are writing code
  )
)

(in-package #:chapter2)
