;;; resistor-color.el --- Resistor Color (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun color-code (color)
  "Return the code of COLOR."
  (seq-position (colors) color))

(defun colors ()
  "Define the list of resistor colors."
  (mapcar 'symbol-name
          '(black brown red orange yellow green blue violet grey white)))


(provide 'resistor-color)
;;; resistor-color.el ends here
