;;;; chapter2.lisp

(in-package #:chapter2)  ; It seems like this line is pretty essential to visibility
                         ; of functions/variables across the pkg
                         ; I'm very unclear of why i have to do this manually in the interpreter

(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Noun))
    (verb-phrase -> (Verb noun-phrase))
    (Article -> the a)
    (Noun -> man ball woman table)
    (Verb -> hit took saw liked))
)

(defvar *grammar* *simple-grammar*
  "This is here because variables CAN be changed at runtime, parameters cannot"
)

(defun rule-lhs (rule)
  "The left-hand side of a rule"
  (first rule)
)

(defun rule-rhs (rule)
  "The right hand side of a rule"
  (rest (rest rule))
)

(defun rewrites (category)
  "Returns a list of the possible rewrites for this category"
  (rule-rhs (assoc category *grammar*))
)

(defun random-elt (choices)
  "Choose an element from a list at random"
  (elt choices (random (length choices)))
)

(defun mappend (fn list-)
  "Apply to each element of the list and append the results"
  (apply #'append (mapcar fn list-))
)
