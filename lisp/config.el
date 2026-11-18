;; -*- lexical-binding: t; -*-
;; WARNING: chasm-mode.el needs to be present in ~/emacs.d/lisp
;; it's available at https://github.com/kode-tar-gz/chasm-mode

(defun my-lisp-setup ()
  "Turn on my preferred minor modes for Lisp programming"
  (rainbow-delimiters-mode 1)
  (smartparens-mode 1)
  (evil-smartparens-mode 1))

;; ------------------------------------------------------
;; -------------- START OF PACKAGES CONFIG --------------

;; ----- set up melpa -----
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; why didn't I know about this sooner...
(setq use-package-always-ensure t)

;; ----- configuration for my own files -----
(use-package match-region-to-cursor
  :ensure nil
  :config
  ;; Trigger this function automatically right after a theme is loaded manually
  ;(advice-add 'load-theme :after (lambda (&rest _) (match-region-to-cursor)))
  ;(add-hook 'window-setup-hook #'match-region-to-cursor)
  ;; If you ever run Emacs as a daemon (using emacsclient), the initial frame
  ;; doesn't exist at startup. This ensures the color syncs when the client connects.
  ;(add-hook 'server-after-make-frame-hook #'match-region-to-cursor)
  )

(use-package kode-dashboard
  :ensure nil
  :hook (window-setup-hook .
            (lambda ()
              (when (string= (buffer-name) "*scratch*")
                (run-with-timer 0.1 nil #'kode-dashboard))))
  :hook (after-make-frame-functions .
	    (lambda (frame)
	      (select-frame frame)
	      (when (display-graphic-p)
                (run-with-timer 0.1 nil #'kode-dashboard)))))

(use-package chasm-mode
  :ensure nil
  ;; we turn off rainbow mode because it thinks constants are colors
  :hook (chasm-mode . (lambda ()(rainbow-mode -1))))

(use-package compuni
  :ensure nil
  :load-path "~/.emacs.d/lisp/compuni"
  :after company
  :commands (compuni-insert-unicode compuni-insert-emoji)
  :bind (("C-c u u" . compuni-insert-unicode)
         ("C-c u e" . compuni-insert-emoji))
  :custom
  (compuni-max-candidates 50))

;; ----- configuration for some built-in packages -----
(use-package autorevert
  :config
  (global-auto-revert-mode 1))

(use-package magit
  :defer t
  :hook (magit-mode . auto-revert-mode))

(use-package dired
  :ensure nil
  :hook (dired-mode . auto-revert-mode)
  :hook (dired-mode . (lambda() (evil-define-key* 'normal 'local (kbd "T") #'dired-create-empty-file)))
  :custom
  ;; make dired try to guess the target when moving / copying
  (dired-dwim-target 't)
  (dired-listing-switches "-alh"))

(use-package compile
  :custom
  (compile-command ""))

(use-package eshell
  :hook (eshell-mode .
	    (lambda ()
	      (setq-local show-trailing-whitespace nil))))

(use-package eglot
  :bind (:map eglot-mode-map
	 ("C-c C-h" . #'eldoc-doc-buffer)))

(use-package ido
  :config
  (ido-mode 1)
  (ido-everywhere 1))

(use-package lisp-mode
  :ensure nil
;;:after (:all rainbow-delimiters-mode
;;	       smartparens-mode
;;	       evil-smartparens-mode)
  :hook (emacs-lisp-mode . my-lisp-setup))

;; ----- evil: for Vim keybindings in emacs (heresy, i know..) -----
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1))

(use-package evil-numbers
  :after (evil)
  :config
  :bind (:map evil-normal-state-map
	      (("C-c =" . #'evil-numbers/inc-at-pt)
	       ("C-c -" . #'evil-numbers/dec-at-pt)
	       ("C-c C-=" . #'evil-numbers/inc-at-pt-incremental)
	       ("C-c C--" . #'evil-numbers/dec-at-pt-incremental))))

(use-package evil-collection
  :after (evil)
  :config
  (evil-collection-init))

(use-package evil-surround
  :after (evil-collection)
  :config
  (global-evil-surround-mode 1))

;; ----- company: our simple autocomplete -----
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (use-package company-c-headers))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this-word)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; ----- gtpel: LLM client in Emacs. Exclusively for local models and I use it mostly for writing. -----
(use-package gptel
  :config
  (setq-default gptel-backend
                (gptel-make-ollama "ollama"
                  :host "localhost:11434"
                  :stream t
                  :models '(qwen2.5:7b qwen2.5-coder:7b qwen2.5:3b)))

  (setq-default gptel-model 'qwen2.5:3b)

  ;; Define custom academic personas
  (setq gptel-directives
        '((default . "You are a large language model and a helpful assistant.")
          (tutor . "You are an expert academic tutor. Do not just give the answer. Use the Socratic method to guide me to the answer. Explain underlying concepts clearly, avoid jargon unless defining it, and ask probing questions to test my understanding.")
          (researcher . "You are a post-doc research assistant. Help me synthesize information, identify gaps in arguments, format citations, and structure academic prose. Be highly critical of logical fallacies.")
          (editor . "You are a strict academic editor. Review the provided text for clarity, flow, and structural integrity. Point out awkward phrasing and suggest more precise academic vocabulary without changing the core meaning.")
          (corrector . "You are a bilingual editor. Correct the grammar and punctuation of this text (French or English). Output ONLY the corrected text, no explanations.")))

  (setq gptel-log-level 'info)
  ;; Map the system prompt selection menu
  (define-key global-map (kbd "C-c s") 'gptel-system-prompt)
  (define-key global-map (kbd "C-c RET") 'gptel-menu))

;; ----- Support for different languages -----
;; ----- rust-mode: always use cargo for compiling (who needs cargo-mode?) -----
(use-package rust-mode
  :hook (rust-mode . eglot-ensure)
  :config
  (add-hook 'rust-mode-hook (lambda () (setq-local compile-command "cargo "))))

(use-package gdscript-mode
  ;; GODOT CONFIGURATION: emacsclient for exec path and -n -a "emacs" {file} for exec flags
  ;; useful link: https://pixelflausen.com/gamedev/emacs-as-godot-editor
  :hook (gdscript-mode . eglot-ensure))

(use-package cmake-mode)

(use-package glsl-mode)

(use-package racket-mode
  :after (:all rainbow-delimiters-mode
	       smartparens-mode
	       evil-smartparens-mode)
  :hook (racket-mode . my-lisp-setup))

;; ----- Lisp-related packages -----
(use-package rainbow-delimiters)
(use-package smartparens)
(use-package evil-smartparens)

;; ----- exec-path-from-shell: use our shell's PATH in emacs -----
(use-package exec-path-from-shell
  :unless (eq system-type 'windows-nt)
  :config
  (exec-path-from-shell-initialize)
  (setenv "BROWSER" "firefox"))

;; ----- our color themes! -----
(use-package quasi-monochrome-theme)
(use-package doom-themes
  :defer t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (setcdr (assoc 'gnus-group-news-low-empty doom-themes-base-faces)
          '(:inherit 'gnus-group-mail-1-empty :weight 'normal)))

;; ----- which-key: helper for showing possible key combinations -----
(use-package which-key
  :config
  (which-key-mode))
(use-package move-text)

;; ----- org-bullets: pretty org-mode headers and such -----
(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-edit-src-content-indentation 0))

;; ----- theming thingies. rainbow-mode for color codes and hl-todo for TODO -----
(use-package rainbow-mode)
(use-package hl-todo
  :config
  (global-hl-todo-mode))

;; ----- flycheck: a requirement for company-mode on mac, apparently -----
(use-package flycheck
  :defer t
  :if (eq system-type 'mac))

;; ----- markdown-mode: pretty self-explanatory. we also get some packages to view formatted markdown -----
(use-package markdown-mode
  :hook (markdown-mode . visual-line-mode))
(use-package markdown-preview-eww
  :after markdown-mode)
(use-package markdown-preview-mode
  :after markdown-mode)

;; -------------- END OF PACKAGES CONFIG --------------
;; ----------------------------------------------------

;; ----- Theming! We can disable a lot of things to make emacs prettier -----
(load-theme 'doom-horizon t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; ----- Font! -----
;; remember to set font name and height in ~/.emacs.d/font.el file. example:
;; (setq kode-font-size 150)
;; (setq kode-font-name "Hack")
;; Bitmap font that I like: GohuFont
;; Vector font that I like: Hack
(load-file (concat user-emacs-directory "font.el"))
(set-face-attribute 'default nil
		    :font kode-font-name
		    :height kode-font-size)

;; ----- Other small graphical details -----
(setq inhibit-startup-screen t)
(setq frame-resize-pixelwise t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq ring-bell-function 'ignore)
(setq-default show-trailing-whitespace t)

(setq gdb-many-windows 't)
(setq make-backup-files nil)

(provide 'config)
