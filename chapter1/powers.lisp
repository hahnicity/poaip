(defun powers (a b)
    "Raise a to the b power (a^b)"
    (cond
        ((equal b 0) 1)
        (t (* a (powers a (- b 1))))
    )
)

(print (powers 3 2))
