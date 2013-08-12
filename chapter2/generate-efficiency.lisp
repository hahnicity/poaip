;;;; generate-efficiency.lisp Exercise 2.2. The wording of the problem was a little confusing
;;;; They mentioned I should code for a non-terminal phrase. Which I thought meant a vocabulary 
;;;; item. Not really, it seems like non-terminal is used to describe non-null item

(in-package #:chapter2)

(defun generate-efficiency (phrase)
  (let ((choices nil)))
  (cond
    ((listp phrase) (mappend #'generate-efficiency phrase))  ; Phrase is a list
    ((not (null (setf choices (rewrites phrase)))) (generate-efficiency (random-elt choices)))
    (t (list phrase))
  )
)

(defun exercise-two-main (phrase)
  (generate-efficiency phrase)
)
