;;;; chapter2.asd

(asdf:defsystem #:chapter2
  :serial t
  :description "Chapter 2 of Principles of Artificial Intelligence Programming"
  :author "Greg Rehm grehm87@gmail.com"
  :license "MIT"
  :components ((:file "package")
               (:file "chapter2")
               (:file "generate-rewrite")
               (:file "generate-efficiency")))

