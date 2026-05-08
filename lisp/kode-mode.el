;; My custom minor mode, mainly used for overriding keybindings.
;; DISCLAIMER: A lot of my custom functions in this file are
;; made with AI (gemini, mostly). Everything else is me, however.

(require 'move-text)
(require 'rust-mode)
(require 'evil)

;; ----- minor mode things -----
(defvar kode-mode-map (make-sparse-keymap)
  "Keymap for 'kode-mode'.")

(define-minor-mode kode-mode
  "A minor mode to override keybindings in other modes."
  :init-value t
  :lighter " kode-mode"
  :keymap kode-mode-map)

;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists
             `((kode-mode . ,kode-mode-map)))

(define-globalized-minor-mode global-kode-mode kode-mode kode-mode)

(defun turn-off-kode-mode ()
  "Turn off kode-mode."
  (kode-mode -1))

;; ----- custom functions -----
(defun open-eshell-below ()
  "Open an eshell buffer in a new window"
  (interactive)
  (split-window-below)
  (other-window 1)
  (eshell))

(defun open-eshell-right ()
  "Open an eshell buffer in a new window"
  (interactive)
  (split-window-right)
  (other-window 1)
  (eshell))

(defun evil-move-text-up ()
  (interactive)
  (call-interactively 'move-text-up)
  (when (evil-visual-state-p)
    (setq deactivate-mark nil)
    (evil-visual-select (region-beginning) (region-end) (evil-visual-type))))

(defun evil-move-text-down ()
  (interactive)
  (call-interactively 'move-text-down)
  (when (evil-visual-state-p)
    (setq deactivate-mark nil)
    (evil-visual-select (region-beginning) (region-end) (evil-visual-type))))

(defun dired-at-point ()
  "Open dired on the path at point.
   If the path is a file, open its parent directory."
  (interactive)
  (let ((path (thing-at-point 'filename t)))
    (if path
        (let ((expanded-path (expand-file-name path)))
          (if (file-directory-p expanded-path)
              (dired expanded-path)
            (dired (file-name-directory expanded-path))))
      (message "No path found at point"))))

(defun smart-compile ()
  "Context-aware compile.
   In wdired: finish edit.
   In magit-commit: finish commit.
   In rust-mode: execute cargo commands.
   Otherwise: compile."
  (interactive)
  (cond
   ((derived-mode-p 'wdired-mode)
    (wdired-finish-edit))

   ((or (derived-mode-p 'git-commit-mode)
        (bound-and-true-p with-editor-mode))
    (with-editor-finish nil))

   (t
    (call-interactively 'compile))))

;; --------------------------------------------------------
;; -------------- START OF KEYBINDING CONFIG --------------

;; ----- kode-mode exceptions -----
(add-hook 'magit-mode-hook 'turn-off-kode-mode)
(add-hook 'minibuffer-setup-hook 'turn-off-kode-mode)

;; ----- unbinding annoying keybindings -----
(define-key global-map (kbd "C-x C-k RET") 'nil)
(define-key global-map (kbd "C-x C-c") 'nil)
(define-key global-map (kbd "M-j") 'nil)
(define-key global-map (kbd "M-k") 'nil)
(define-key global-map (kbd "s-x") 'nil)
(define-key global-map (kbd "C-_") 'nil)
(define-key evil-motion-state-map (kbd "\\") 'nil)

;; ----- custom keybindings, applied to all buffers -----
(define-key kode-mode-map (kbd "C-c e")     'open-eshell-below)
(define-key kode-mode-map (kbd "C-c s")     'open-eshell-right)
(define-key kode-mode-map (kbd "C-c m")     'man)
(define-key kode-mode-map (kbd "C-c C-c")   'smart-compile)
(define-key kode-mode-map (kbd "C-c C-e")   'eval-region)
(define-key kode-mode-map (kbd "C-c C-v")   'grep)
(define-key kode-mode-map (kbd "C-c C-S-f") 'uncomment-region)
(define-key kode-mode-map (kbd "C-c C-f")   'find-file-at-point)
(define-key kode-mode-map (kbd "C-c C-d")   'dired-at-point)
(define-key kode-mode-map (kbd "C-x C-d")   'ido-dired)
(define-key kode-mode-map (kbd "C-x C-h")   'previous-buffer)
(define-key kode-mode-map (kbd "C-x C-l")   'next-buffer)
(define-key kode-mode-map (kbd "C-x C-s")   (lambda () (interactive) (switch-to-buffer "*scratch*")))
(define-key kode-mode-map (kbd "C-x C-q")   'delete-frame)

;; ----- normal mode keybindings -----
(evil-define-key 'normal kode-mode-map (kbd "M-k")     'evil-move-text-up)
(evil-define-key 'normal kode-mode-map (kbd "M-j")     'evil-move-text-down)
(evil-define-key 'normal kode-mode-map (kbd "C-j")     'scroll-up-command)
(evil-define-key 'normal kode-mode-map (kbd "C-k")     'scroll-down-command)
(evil-define-key 'normal kode-mode-map (kbd "C-c +")   'evil-numbers/inc-at-pt)
(evil-define-key 'normal kode-mode-map (kbd "C-c -")   'evil-numbers/dec-at-pt)

;; ----- insert mode keybindings -----
(evil-define-key 'insert kode-mode-map (kbd "C-x C-c") 'evil-normal-state)
;; these bindings arent needed when im using my split keyboard
;;(evil-define-key 'insert kode-mode-map (kbd "M-h")     'left-char)
;;(evil-define-key 'insert kode-mode-map (kbd "M-j")     'next-line)
;;(evil-define-key 'insert kode-mode-map (kbd "M-k")     'previous-line)
;;(evil-define-key 'insert kode-mode-map (kbd "M-l")     'right-char)
(evil-define-key 'insert kode-mode-map (kbd "C-p")     'evil-paste-after)

;; ----- visual mode keybindings -----
(evil-define-key 'visual kode-mode-map (kbd "C-x C-c") 'evil-normal-state)
(evil-define-key 'visual kode-mode-map (kbd "M-k")     'evil-move-text-up)
(evil-define-key 'visual kode-mode-map (kbd "M-j")     'evil-move-text-down)

;; ----- keybindings for specific modes -----
(evil-define-key 'normal dired-mode-map (kbd "T") 'dired-create-empty-file)

;; -------------- END OF KEYBINDING CONFIG --------------
;; ------------------------------------------------------

;; Other keybindings I use a lot (dont forget these!):
;; "+" in dired (normal mode): create directory
;; "C-x w d": toggle window to dedicated (won't change buffers)
;; "g r" in magit: reload magit
;; read later: https://tuhdo.github.io/c-ide.html#sec-2

(provide 'kode-mode)
