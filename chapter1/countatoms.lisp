(defun count-atoms (expr)
  (setf atoms 0)
  (loop for x in expr do
    (cond 
      ((atom x) (setf atoms(+ atoms 1)))
      ((> (length x) 0) (setf atoms (+ atoms (count-atoms x))))))
  atoms
)

(print (count-atoms '(1 nil 3 4 (1 2 4))))
