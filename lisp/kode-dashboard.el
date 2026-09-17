;; -*- lexical-binding: t; -*-
;; DISCLAIMER: This file was made with lots of generative AI assistance.

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
(defun kode-dashboard-insert-button (label command command_str)
  "Insert a horizontally centered button with LABEL that executes COMMAND."
  (let ((padding (max 0 (/ (- (window-width) (string-width label)) 2))))
    (insert (make-string padding ?\s))
    (insert-button label
                   'action `(lambda (_)
                              (if (commandp ',command)
                                  (call-interactively ',command)
                                (funcall ',command)))
                   'follow-link t
                   'help-echo (format "Click to run %s" command_str)
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

;; NEW: Separate rendering logic so it redraws cleanly on resize
(defun kode-dashboard-render (&optional _)
  "Erase and redraw the dashboard based on current window dimensions."
  (let ((win (get-buffer-window "*kode-dashboard*")))
    (when win
      ;; Temporarily make the dashboard window the "selected" one so that
      ;; (window-width) and (window-height) calculate the correct padding
      (with-selected-window win
        (let ((inhibit-read-only t)
              ;; Save the button label we are currently hovering to restore point later
              (saved-label (when (button-at (point))
                             (button-label (button-at (point))))))
          (erase-buffer)
          (remove-overlays)

          ;; Insert ASCII art near the top
          (kode-dashboard-insert-ascii kode-dashboard-ascii)

          ;; Calculate dynamic vertical padding
          (let* ((current-line (line-number-at-pos))
                 (target-line (/ (window-height) 2))
                 (pad-lines (max 2 (- target-line current-line))))
            (insert (make-string pad-lines ?\n)))

          ;; Insert the buttons
          (kode-dashboard-insert-button "[ open config ]"   (lambda () (interactive) (dired "~/.emacs.d/")) "~/.emacs.d/")
          (kode-dashboard-insert-button "[ be productive ]" (lambda () (interactive) (dired "~/src/")) "~/src/")
          (kode-dashboard-insert-button "[ procrastinate ]" 'tetris "tetris")
          (kode-dashboard-insert-button "[ restart ]"       'restart-emacs "restart-emacs")

          ;; Restore cursor position
          (goto-char (point-min))
          (let ((found nil))
            (if saved-label
                (while (and (not found) (forward-button 1))
                  (when (string= (button-label (button-at (point))) saved-label)
                    (setq found t)))
              (forward-button 1)))

          ;; Ensure the visual highlight reappears after redrawing
          (kode-dashboard-update-cursor-highlight))))))

;; 5. The main function to setup the dashboard
(defun kode-dashboard ()
  "Generate and display a minimal, centered custom dashboard."
  (interactive)
  (let ((buf (get-buffer-create "*kode-dashboard*")))
    (with-current-buffer buf
      (special-mode)
      (read-only-mode +1)
      (setq-local truncate-lines t)
      (setq-local show-trailing-whitespace nil)
      (display-line-numbers-mode -1)

      (let ((dashboard-map (make-sparse-keymap)))
        (set-keymap-parent dashboard-map (current-local-map))
        (define-key dashboard-map (kbd "TAB") 'forward-button)
        (define-key dashboard-map (kbd "<tab>") 'forward-button)
        (define-key dashboard-map (kbd "<backtab>") 'backward-button)
        (use-local-map dashboard-map))

      ;; Hooks
      (add-hook 'post-command-hook #'kode-dashboard-update-cursor-highlight nil t)
      ;; Bind the resize hook strictly locally to this buffer
      (add-hook 'window-size-change-functions #'kode-dashboard-render nil t))

    (switch-to-buffer buf)
    ;; Trigger the initial draw now that the buffer is actually visible in a window
    (kode-dashboard-render)
    buf)) ;; Return the buffer

(provide 'kode-dashboard)
