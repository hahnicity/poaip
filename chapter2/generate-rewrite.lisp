;;;; generate-rewrite.lisp Exercise 2.1

; for a more in depth explanation of # notation try: 
; http://www.gigamonkeys.com/book/programming-in-the-large-packages-and-symbols.html

; Damnit, so you can set variables in conditional... I should've just defined it as nil

(in-package #:chapter2)

(defun generate-rewrite (phrase)
  (let ((choices nil)))
  (cond
    ((listp phrase) (mappend #'generate-rewrite phrase))  ; Phrase is a list
    ((setf choices (rewrites phrase)) (generate-rewrite (random-elt choices)))
    (t (list phrase))
  )
)


(defun exercise-one-main (phrase)
  (generate-rewrite phrase)
)
