;;; resistor-color-duo.el --- Resistor Color Duo (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun value (colors)
  "Return a two digit number for COLORS."
  (let* ((all-colors '("black" "brown" "red" "orange" "yellow"
                       "green" "blue" "violet" "grey" "white"))
         (selected-colors (seq-take colors 2))
         (pick-color (lambda (color) (seq-position all-colors color)))
         (values (mapcar pick-color selected-colors)))
    (string-to-number (format "%d%d" (car values) (cadr values)))))


(provide 'resistor-color-duo)
;;; resistor-color-duo.el ends here
