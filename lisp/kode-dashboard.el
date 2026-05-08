;; 1. Define your ASCII art
(defvar kode-dashboard-ascii
  "
        ⠀⠀⠀⠀⡌⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⠉⢳⠀⠘⠀⠀⠀
        ⠀⠀⠀⡸⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠈⡆⠀⡇⠀⠀
        ⠀⠀⠀⣳⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠁⠀⡇⠀⠀
        ⠀⠀⢀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢰⠀⡇⠀⠀
        ⠀⠀⠈⢸⣿⣿⣿⣿⣿⣿⣿⡟⢸⡏⠀⢸⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠇⠀⠀
        ⠀⠀⠀⠸⠛⣿⣿⣿⣿⣟⢻⠀⢸⡇⠀⢸⠀⣿⡇⣿⣿⣿⣿⡟⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠈⣿⣿⡏⢉⠙⠓⢾⣙⠀⢸⠀⠏⡇⠟⠻⣿⣿⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡜⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⣿⢻⣷⠙⣿⣦⣄⡉⠁⠈⠀⠀⠇⠤⠴⠿⢶⣤⣀⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⠰⠁⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⢹⠈⢿⡈⠛⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠾⣧⣀⠉⠙⠲⢿⣏⣿⣿⣿⣿⣿⣏⡄⣿⣿⡟⡀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢿⣿⣿⣷⠖⠀⠈⣿⣿⣿⣿⡿⢋⣾⣿⣿⢧⡇⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣆⠀⠀⠀⠀⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣟⣿⣶⣿⣿⣿⡟⠸⡀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⡀⠀⠘⠢⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⣿⣽⣿⣟⠻⠻⠏⠟⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⡀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢞⣿⣿⣿⣿⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠤⣼⣏⡗⢄⠀⠀⠀⠀⠀⢀⡠⣤⡤⢔⡫⠔⢻⣿⣿⣿⠃⣸⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⠀⠀⠀⢀⣠⠴⣪⣵⣾⣿⣿⡇⠀⠉⢲⠒⠒⠚⢀⡩⠴⠒⠉⠀⠀⢸⣿⣿⡇⠀⢸⣄⠑⢄⠀⠀⠀⠀⠀⠀⠀
        ⠀⠀⠀⣠⢔⣨⣥⣾⣿⣿⣿⣿⣿⣿⠁⣀⣴⣿⣷⠀⠉⠁⠀⠀⠀⠀⠀⠀⣿⣿⣿⠁⠀⡏⠀⠑⢌⠡⡀⠀⠀⠀⠀⠀
        ⢀⣴⡟⠋⠁⣴⣿⣿⣿⣿⣿⣿⣿⣧⣾⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⠀⠀⡇⠀⠀⠀⠱⡘⣆⠀⠀⠀⠀
        ⢸⣻⣧⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⢀⡴⣻⣿⣿⡇⠀⢸⠀⠀⠀⠀⠀⠈⡧⡑⡄⠀⠀
        ⢸⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠑⠒⢐⣶⣿⣿⣿⣿⣿⣀⣠⡿⠀⠀⠀⠀⠀⣸⠁⠈⢜⢄⠀
        ⣘⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣀⣀⡀⣀⣠⠃⠀⠀⠀⠁⢢



██╗  ██╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗  ██████╗███████╗
██║ ██╔╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
█████╔╝ ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██║     ███████╗
██╔═██╗ ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
██║  ██╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
"
  "The ASCII art to display at the top of the dashboard.")

;; 2. Helper to insert the ASCII art centered horizontally (Now with Color!)
(defun kode-dashboard-insert-ascii (ascii-str)
  "Insert ASCII-STR centered horizontally with a specific face."
  (let* ((lines (split-string ascii-str "\n"))
         (max-width (apply #'max (mapcar #'string-width lines)))
         (padding (+ 1 (max 0 (/ (- (window-width) max-width) 2)))))
    (dolist (line lines)
      (insert (make-string padding ?\s)
              ;; Propertize applies the face (color) to the string
              (propertize line 'face 'font-lock-comment-face)
              "\n"))))

;; 3. Helper to insert interactive, centered buttons (Upgraded with Colors!)
(defun kode-dashboard-insert-button (label command)
  "Insert a horizontally centered button with LABEL that executes COMMAND."
  (let ((padding (max 0 (/ (- (window-width) (string-width label)) 2))))
    (insert (make-string padding ?\s))
    (insert-button label
                   'action `(lambda (_)
                              (if (commandp ',command)
                                  (call-interactively ',command)
                                (funcall ',command)))
                   'follow-link t
                   'help-echo (format "Click to run %s" command)
                   ;; The default color of the button
                   'face '(bold font-lock-keyword-face)
                   ;; The color when your mouse/cursor highlights it
                   'mouse-face '(bold font-lock-function-name-face))
    (insert "\n\n")))

(defvar-local kode-dashboard--cursor-overlay nil
  "Overlay used to highlight the currently selected button.")

;; 4. The Highlight Engine (Bulletproofed with Priority)
(defun kode-dashboard-update-cursor-highlight ()
  "Move the highlight overlay to the button under point."
  ;; 1. Make sure the overlay exists AND is alive in the current buffer
  (unless (and (overlayp kode-dashboard--cursor-overlay)
               (eq (overlay-buffer kode-dashboard--cursor-overlay) (current-buffer)))
    (setq kode-dashboard--cursor-overlay (make-overlay 0 0))
    (overlay-put kode-dashboard--cursor-overlay 'face '(bold font-lock-function-name-face))
    ;; Force this overlay to ALWAYS override text colors
    (overlay-put kode-dashboard--cursor-overlay 'priority 100))

  ;; 2. Find button and move overlay
  (let ((btn (button-at (point))))
    (if btn
        (move-overlay kode-dashboard--cursor-overlay
                      (button-start btn)
                      (button-end btn)
                      (current-buffer))
      ;; If not on a button, hide the overlay at the very start of the buffer
      (move-overlay kode-dashboard--cursor-overlay 0 0 (current-buffer)))))

;; 5. The main function to draw the dashboard
(defun kode-dashboard ()
  "Generate a minimal, centered custom dashboard."
  (interactive)
  (let ((buf (get-buffer-create "*kode-dashboard*")))
    (with-current-buffer buf
      (special-mode)
      (let ((inhibit-read-only t))
        (erase-buffer)
	(remove-overlays)

        ;; Insert ASCII art near the top
        (kode-dashboard-insert-ascii kode-dashboard-ascii)

        ;; Calculate dynamic vertical padding to push buttons to the middle
        (let* ((current-line (line-number-at-pos))
               (target-line (/ (window-height) 2))
               ;; Ensure at least 2 lines of gap if ASCII art is very tall
               (pad-lines (max 2 (- target-line current-line))))
          (insert (make-string pad-lines ?\n)))

        ;; Insert the buttons
        (kode-dashboard-insert-button "[ Open Config ]" (lambda () (interactive) (dired "~/.emacs.d/")))
        (kode-dashboard-insert-button "[ Be productive ]" (lambda () (interactive) (dired "~/src")))
        ;(kode-dashboard-insert-button "[ Magit ]" 'magit-status)
        (kode-dashboard-insert-button "[ Procrastinate ]" 'tetris))

      ;; Lock down the buffer
      (read-only-mode +1)
      (display-line-numbers-mode -1)
      (setq-local truncate-lines t)
      (setq-local show-trailing-whitespace nil)

      ;; Activate our custom keyboard-hover engine (the 't' makes it local to this buffer only)
      (add-hook 'post-command-hook #'kode-dashboard-update-cursor-highlight nil t)

      ;; Move cursor to the first button
      (goto-char (point-min))
      (forward-button 1))

    ;; Finally, display the buffer
    (switch-to-buffer buf)))
(provide 'kode-dashboard)
