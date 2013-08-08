(defun dot-product (a b)
  "Computes the dot product of two vectors"
  (print a)
  (cond
    ((= (length a) 1) (+ (* (first a) (first b))))
    (t (+ (* (first a) (first b)) (dot-product (rest a) (rest b))))
  )
)
