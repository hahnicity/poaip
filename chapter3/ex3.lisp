;;;; ex3.lisp

(in-package #:chapter3)

(defun print-dot-notation (expr)
  (let ((dot-notation nil)))
  (cond
    ((null (cdr expr)) (setf dot-notation (format nil "(~S . ~S)" (car expr) nil)))
    ((listp (cdr expr)) (setf dot-notation (format nil "(~S . (~S))" (car expr) (print-dot-notation (cdr expr)))))
    (t (princ (dot-notation)))
  )
)

(defun ex-three-main (input)
  (print-dot-notation input)
)
