;;; accumulate.el --- Accumulate (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun accumulate (lst op)
  "Accumulate result of applying OP to each item in LST."
  (if (null lst) lst
    (cons (funcall op (car lst))
          (accumulate (cdr lst) op))))


(provide 'accumulate)
;;; accumulate.el ends here
