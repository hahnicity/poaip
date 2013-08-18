;;;; chapter2.lisp

(in-package #:chapter2)  ; It seems like this line is pretty essential to visibility
                         ; of functions/variables across the pkg
                         ; I'm very unclear of why i have to do this manually in the interpreter

(defparameter *simple-grammar*
  '((sentence (noun-phrase verb-phrase))
    (noun-phrase (Article Adj* Noun PP*) (Name) (Pronoun))
    (verb-phrase (Verb noun-phrase PP*))
    (PP* () (PP PP*))
    (Adj* () (Adj Adj*))
    (PP (Prep noun-phrase)))
)

(defparameter *simple-vocabulary*
    '((Prep to in by with on)
      (Adj big little blue green adiabatic)
      (Article the a)
      (Name Pat Kim Lee Terry Robin)
      (Noun man ball woman table)
      (Verb hit took saw liked)
      (Pronoun he she it these those that))
)

(defparameter *simple-math*
  '((addition (add-operator num num))
    (subtraction (sub-operator num num))
    (multiplication (mult-operator num num))
    (division (div-operator num num)))
)

(defparameter *simple-symbols*
  '((add-operator . (+))
    (sub-operator . (-))
    (mult-operator . (*))
    (div-operator . (/))
    (num 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
)

(defvar *grammar* *simple-math*
  "This is here because variables CAN be changed at runtime, parameters cannot"
)

(defvar *vocabulary* *simple-symbols*
  "Set the desired vocabulary to a simple set"
)

(defun rewrites (category)
  "Returns a list of the possible rewrites for this category. Return set of vocabulary if it is desired"
  ;(format t "category ~S~%, member ~S~%" category (assoc category *vocabulary*))  
  ; Commented code sucks, but the abov is educational for me
  ;(print "ASSOC")
  (cond
    ((not (null (setf association (get-vocab category)))) association)
    (t (get-grammar category))
  )
)

(defun get-grammar (category)
  "Returns all grammar associations"
  ;(print (rest (assoc category *grammar*)))
  (rest (assoc category *grammar*))
)

(defun get-vocab (category)
  "Returns all vocab associations"
  (rest (assoc category *vocabulary*))
)

(defun random-elt (choices)
  "Choose an element from a list at random"
  (elt choices (random (length choices)))
)

(defun mappend (apply-fn mapcar-fn list-)
  "Apply to each element of the list and append the results"
  (apply apply-fn (mapcar mapcar-fn list-))
)
