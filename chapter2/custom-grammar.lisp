;;;; custom-grammar.lisp

(in-package #:chapter2)

(defun custom-grammar (phrase)
  (let ((is-vocab nil) (is-grammar nil)))
  (print phrase)
  (cond
    ((listp phrase) (mappend #'custom-grammar phrase))  ; Phrase is a list
    ((not (null (setf is-grammar (get-grammar phrase)))) (custom-grammar is-grammar))
    ((not (null (setf is-vocab (get-vocab phrase)))) (random-elt is-vocab))
    (t (list phrase))
  )
)

(defun exercise-three-main (phrase)
  (custom-grammar phrase)
)
