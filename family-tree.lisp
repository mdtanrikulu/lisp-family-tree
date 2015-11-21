(defparameter *family* '(((Alfred Barbara) Ceaser Daisy Eric Fabio)
                         ((Ceaser Ulla) Mabel Nadia Odin)
                         ((Daisy Valence) nil)
                         ((Eric Walentyna) Pablo Qiana)
                         ((Fabio) nil)
                         ((Mabel Xandra) Rachel)
                         ((Nadia Yoshi) nil)
                         ((Odin) nil)
                         ((Pablo) nil)
                         ((Qiana) nil)))

(defun show-siblings-of (person family)
  "Return a list of PERSON's siblings."
  (remove person (cdr (find person family :key #'cdr :test #'member))))

(defun are-siblings-defun (person1 person2 family)
  "Are PERSON1 and PERSON2 siblings?"
  (if (equal (find person2 (show-siblings-of person1 family)) person2)
  (format nil "Yes! ~A and ~A are siblings!" person1 person2)
  (format nil "No! ~A and ~A are not siblings!" person1 person2))
)

(defmacro are-siblings (person1 person2 family)
  "Are PERSON1 and PERSON2 siblings?"
 (list 'find person2 (list 'show-siblings-of person1 family))
 (list 'if (list 'equal (list 'find person2 (list 'show-siblings-of person1 family)) person2)
         (list 'format nil "Yes! ~A and ~A are siblings!" person1 person2)
         (list 'format nil "No! ~A and ~A are not siblings!" person1 person2)))

(defun show-parents-of (person family)
  "Return a list of PERSON's parents."
  (car (find person family :key #'cdr :test #'member)))

(defun is-parent-defun (parent child family)
  "Is PARENT a parent of CHILD?"
  (find parent (show-parents-of child family))
  (if (equal (find parent (show-parents-of child family)) parent)
  (format nil "Yes! ~A is parent of ~A!" parent child)
  (format nil "No! ~A is not parent of ~A!" parent child))
)

(defmacro is-parent (parent child family)
  "Is PARENT a parent of CHILD?"
  (list 'find parent (list 'show-parents-of child family))
  (list 'if (list 'equal (list 'find parent (list 'show-parents-of child family)) parent)
         (list 'format nil "Yes! ~A is parent of ~A!" parent child)
         (list 'format nil "No! ~A is not parent of ~A!" parent child)))
  

(defun show-ancestors-of (person family)
  "Return a list of PERSON's ancestors"
(if (equal (find person family :key #'cdr :test #'member) NIL)
(format nil "We haven't this record!")
(if (equal (car (find (car(car(find person family :key #'cdr :test #'member))) family :key #'cdr :test #'member)) NIL)
(format nil "We haven't this record!")
 (car (find (car(car(find person family :key #'cdr :test #'member))) family :key #'cdr :test #'member))))
)
   

(defmacro is-ancestor (ancestor grandson family)
  "Is ANCESTOR a parent of GRANDSON?"
  (list 'find ancestor (list 'show-ancestors-of grandson family))
  (list 'if (list 'equal (list 'find ancestor (list 'show-ancestors-of grandson family)) ancestor)
         (list 'format nil "Yes! ~A is ancestor of ~A!" ancestor grandson)
         (list 'format nil "No! ~A is not ancestor of ~A!" ancestor grandson)))

(defun show-grandsons-of (person family)
  "Return a list of PERSON's parents."
   (set (quote *sons*) (cdr(find person family :key #'car :test #'member)))
   (loop for x in *sons*
      do (print (cdr(find x family :key #'car :test #'member)) ))
)

(defmacro is-grandson (grandson ancestor family)
  "Is GRANDSON a parent of ANCESTOR?"
   (list 'find ancestor (list 'show-ancestors-of grandson family))
   (list 'if (list 'equal (list 'find ancestor (list 'show-ancestors-of grandson family)) ancestor)
         (list 'format nil "Yes! ~A is grandson of ~A!" grandson ancestor)
         (list 'format nil "No! ~A is not grandson of ~A!" grandson ancestor)))
