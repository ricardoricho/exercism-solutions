;;; raindrops.el --- Raindrops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun convert (number)
  "Convert NUMBER into its corresponding raindrop sound.

Given a number is divisible by 3, add \"Pling\" to the result.
is divisible by 5, add \"Plang\" to the result.
is divisible by 7, add \"Plong\" to the result.
is not divisible by 3, 5, or 7, the result should be the number as a string."
  (let ((pling (and (zerop (mod number 3)) "Pling"))
        (plang (and (zerop (mod number 5)) "Plang"))
        (plong (and (zerop (mod number 7)) "Plong")))
    (if (or pling plang plong)
        (concat pling plang plong)
      (number-to-string number))))

(provide 'raindrops)
;;; raindrops.el ends here
