(defparameter *titles*
 '(Jr. Sr. II III IV V VI VII VIII IX X MD DO JD))

(defun last-name (name)
    "Select a last name from input"
    (print name)

    (if (member (first (last name)) *titles*)
        "butlast removes the last item of a list and returns the result. But the list is not modified"
        "More documentation is available: http://www.lispworks.com/documentation/HyperSpec/Body/f_butlas.htm"
        (last-name (butlast name))
        (first (last name)))
 )

(print (last-name '(Baz Bar DO)))
