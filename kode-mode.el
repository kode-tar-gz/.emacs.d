;; My custom minor mode, mainly used for overriding keybindings.

(require 'move-text)
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

(defun smart-compile ()
  "Context-aware compile. 
   In wdired: finish edit. 
   In magit-commit: finish commit.
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

;; kode-mode exceptions (modes and buffers where kode-mode should be disabled):
(add-hook 'magit-mode-hook 'turn-off-kode-mode)
(add-hook 'minibuffer-setup-hook 'turn-off-kode-mode)

;; here's where my custom keybindings, applied to all buffers, reside.
(define-key kode-mode-map (kbd "C-c e")   'open-eshell-below)
(define-key kode-mode-map (kbd "C-c s")   'open-eshell-right)
(define-key kode-mode-map (kbd "C-c C-c") 'smart-compile)
(define-key kode-mode-map (kbd "C-c C-v") 'grep)
(define-key kode-mode-map (kbd "C-c C-f") 'comment-region)
(define-key kode-mode-map (kbd "C-c C-d") 'comment-indent)
(define-key kode-mode-map (kbd "C-x C-h") 'previous-buffer)
(define-key kode-mode-map (kbd "C-x C-l") 'next-buffer)
(define-key kode-mode-map (kbd "C-x C-s") 'scratch-buffer)
(define-key kode-mode-map (kbd "C-x C-q") 'delete-frame)

;; unbinding certain annoying keybindings
(define-key global-map (kbd "C-x C-c") 'nil)
(define-key global-map (kbd "M-j") 'nil)
(define-key global-map (kbd "M-k") 'nil)
(define-key global-map (kbd "s-x") 'nil)

;; keybindings applied only in normal mode (evil stage)
(evil-define-key 'normal kode-mode-map (kbd "M-j")     'move-text-down)
(evil-define-key 'normal kode-mode-map (kbd "M-k")     'move-text-up)
(evil-define-key 'normal kode-mode-map (kbd "C-j")     'scroll-up-command)
(evil-define-key 'normal kode-mode-map (kbd "C-k")     'scroll-down-command)

;; keybindings applied only in insert mode
(evil-define-key 'insert kode-mode-map (kbd "C-x C-c") 'evil-normal-state)
(evil-define-key 'insert kode-mode-map (kbd "M-h") 'evil-backward-char)
(evil-define-key 'insert kode-mode-map (kbd "M-j") 'evil-next-line)
(evil-define-key 'insert kode-mode-map (kbd "M-k") 'evil-previous-line)
(evil-define-key 'insert kode-mode-map (kbd "M-l") 'evil-forward-char)

;; keybindings applied only in visual mode
(evil-define-key 'visual kode-mode-map (kbd "C-x C-c") 'evil-normal-state)

;; keybindings applied only to specific modes
(define-key minibuffer-mode-map (kbd "M-j") 'ido-next-match)
(define-key minibuffer-mode-map (kbd "M-k") 'ido-prev-match)

(provide 'kode-mode)
