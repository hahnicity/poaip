;;;; chapter2.lisp

(in-package #:chapter2)  ; It seems like this line is pretty essential to visibility
                         ; of functions/variables across the pkg
                         ; I'm very unclear of why i have to do this manually in the interpreter

(defparameter *simple-grammar*
  '((sentence -> (noun-phrase verb-phrase))
    (noun-phrase -> (Article Adj* Noun PP*) (Name) (Pronoun))
    (verb-phrase -> (Verb noun-phrase PP*))
    (PP* -> () (PP PP*))
    (Adj* -> () (Adj Adj*))
    (PP -> (Prep noun-phrase)))
)

(defparameter *simple-vocabulary*
    '((Prep -> to in by with on)
      (Adj -> big little blue green adiabatic)
      (Article -> the a)
      (Name -> Pat Kim Lee Terry Robin)
      (Noun -> man ball woman table)
      (Verb -> hit took saw liked)
      (Pronoun -> he she it these those that))
)

(defvar *grammar* *simple-grammar*
  "This is here because variables CAN be changed at runtime, parameters cannot"
)

(defvar *vocabulary* *simple-vocabulary*
  "Set the desired vocabulary to a simple set"
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
  "Returns a list of the possible rewrites for this category. Return set of vocabulary if it is desired"
  ;(format t "category ~S~%, member ~S~%" category (assoc category *vocabulary*))  
  ; Commented code sucks, but the abov is educational for me
  (let ((association nil)))
  (cond
    ((not (null (setf association (assoc category *vocabulary*)))) association)
    (t (rule-rhs (assoc category *grammar*)))
  )
)

(defun random-elt (choices)
  "Choose an element from a list at random"
  (elt choices (random (length choices)))
)

(defun mappend (fn list-)
  "Apply to each element of the list and append the results"
  (apply #'append (mapcar fn list-))
)
