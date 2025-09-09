;;; queen-attack.el --- Queen Attack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun valid-position-p (queen)
  "Validate position of QUEEN in an 8x8 board."
  (let ((row (car queen))
        (column (cdr queen)))
    (and (< row 8) (>= row 0)
         (< column 8) (>= column 0))))

(defun can-attack-p (white-queen black-queen)
  "Check if WHITE-QUEEN and BLACK-QUEEN could attack eachother."
  (let* ((white-row (car white-queen))
         (white-column (cdr white-queen))
         (black-row (car black-queen))
         (black-column (cdr black-queen))
         (diff-row (abs (- black-row white-row)))
         (diff-column (abs (- black-column white-column))))
    (when (and (valid-position-p white-queen)
               (valid-position-p black-queen))
      (or (zerop diff-row)
          (zerop diff-column)
          (zerop (- diff-row diff-column))))))



(provide 'queen-attack)
;;; queen-attack.el ends here
