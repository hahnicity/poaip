;;;; ex3.lisp
;;;; Not working... will need to fix this up

(in-package #:chapter3)

(defun print-dot-notation (expr)
  (print expr)
  (cond
    ((null expr) ())
    ((listp (cdr expr)) (princ (format nil "~S.~S" (car expr) (print-dot-notation (cdr expr)))))
    (t (princ (format nil "~S.~S" (car expr) (cdr expr))))
  )
)

(defun ex-three-main (expr)
  (print-dot-notation expr)
)
