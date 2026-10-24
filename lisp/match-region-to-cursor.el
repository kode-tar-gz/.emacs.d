;; -*- lexical-binding: t; -*-
;; DISCLAIMER: This file is almost completely written with AI.

(defun match-region-to-cursor ()
  "Make the selection (region) background match the cursor color."
  (interactive)
  (let ((cursor-bg (face-background 'cursor nil t)))
    (when cursor-bg
      ;; Set the region's background to match the cursor
      (set-face-attribute 'region nil :background cursor-bg)

      ;; This line forces the text inside your selection to match the
      ;; background color, ensuring high contrast.
      (set-face-attribute 'region nil :foreground (face-background 'default nil t)))))
(provide 'match-region-to-cursor)
