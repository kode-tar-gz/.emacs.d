;; DISCLAIMER: This file is almost completely written with AI.

(defun match-region-to-cursor ()
  "Make the selection (region) background match the cursor color."
  (interactive)
  ;; Get the background color of the cursor face
  (let ((cursor-bg (face-background 'cursor nil t)))
    (when cursor-bg
      ;; Set the region's background to match the cursor
      (set-face-attribute 'region nil :background cursor-bg)

      ;; This line forces the text inside your selection to match the
      ;; background color, ensuring high contrast.
      (set-face-attribute 'region nil :foreground (face-background 'default nil t)))))

;; Trigger this function automatically right after a theme is loaded manually
(advice-add 'load-theme :after (lambda (&rest _) (match-region-to-cursor)))

;; Wait until Emacs has fully drawn the window system on startup before running
(add-hook 'window-setup-hook #'match-region-to-cursor)

;; If you ever run Emacs as a daemon (using emacsclient), the initial frame
;; doesn't exist at startup. This ensures the color syncs when the client connects.
(add-hook 'server-after-make-frame-hook #'match-region-to-cursor)

(provide 'match-region-to-cursor)
