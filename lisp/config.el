(require 'package)
(defun ensure-package (package)
  "Install PACKAGE if it is not already installed."
  (unless (package-installed-p package)
    (package-install package)))

;; ------------------------------------------------------
;; -------------- START OF PACKAGES CONFIG --------------

;; ----- set up melpa -----
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; ----- ensure that every package we need is installed -----
(ensure-package 'evil)
(ensure-package 'evil-collection)
(ensure-package 'evil-numbers)
(ensure-package 'magit)
(ensure-package 'company)
(ensure-package 'company-c-headers)
(ensure-package 'rust-mode)
(ensure-package 'exec-path-from-shell)
(ensure-package 'quasi-monochrome-theme)
(ensure-package 'doom-themes)
(ensure-package 'rainbow-mode)
(ensure-package 'which-key)
(ensure-package 'org-bullets)
(ensure-package 'rainbow-mode)
(ensure-package 'move-text)
(ensure-package 'hl-todo)
(ensure-package 'flycheck)
(ensure-package 'markdown-mode)
(ensure-package 'markdown-preview-eww)
(ensure-package 'markdown-preview-mode)
;; UNCOMMENT THIS IF ON A FRESH INSTALL:
;;(package-refresh-contents)

;; ----- configuration for some built-in packages -----
(use-package autorevert
  :config
  (global-auto-revert-mode 1))

(use-package magit
  :config
  (add-hook 'magit-mode-hook 'auto-revert-mode))

(use-package dired
  :custom
  ;; make dired try to guess the target when moving / copying
  (dired-dwim-target 't)
  (dired-listing-switches "-alh")
  :config
  (add-hook 'dired-mode-hook 'auto-revert-mode))

(use-package compile
  :custom
  (compile-command ""))

(use-package eglot
  :bind (:map eglot-mode-map
	 ("C-c C-h" . #'eldoc-doc-buffer)))

(use-package ido
  :config
  (ido-mode 1)
  (ido-everywhere 1))

;; ----- evil: for Vim keybindings in emacs (heresy, i know..) -----
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-numbers
  :after (evil))
(use-package evil-collection
  :after (evil)
  :config
  (evil-collection-init))

;; ----- company: our simple autocomplete -----
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (use-package company-c-headers))

;; ----- chasm-mode: my custom chasm language's mode -----
(use-package chasm-mode
  :config
  ;; we turn off rainbow mode because it thinks constants are colors
  (add-hook 'chasm-mode-hook (lambda ()(rainbow-mode -1))))

;; ----- rust-mode: always use cargo for compiling (who needs cargo-mode?) -----
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook
	    (lambda ()
	      (setq-local compile-command "cargo ")))
  (add-hook 'rust-mode-hook 'eglot-ensure))

;; ----- exec-path-from-shell: use our shell's PATH in emacs -----
(use-package exec-path-from-shell
  :unless (eq system-type 'windows-nt)
  :config
  (exec-path-from-shell-initialize)
  (setenv "BROWSER" "firefox"))

;; ----- our color themes! -----
(use-package quasi-monochrome-theme)
(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t))

;; ----- which-key: helper for showing possible key combinations -----
(use-package which-key
  :config
  (which-key-mode))
(use-package move-text)

;; ----- org-bullets: prettier org-mode headers and such -----
(use-package org-bullets
  :custom
  (org-edit-src-content-indentation 0)
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; ----- theming thingies. rainbow-mode for color codes and hl-todo for TODO -----
(use-package rainbow-mode)
(use-package hl-todo
  :config
  (global-hl-todo-mode))

;; ----- flycheck: a requirement for company-mode on mac, apparently -----
(use-package flycheck
  :if (eq system-type 'mac))

;; ----- markdown-mode: pretty self-explanatory. we also get some packages to view formatted markdown -----
(use-package markdown-mode)
(use-package markdown-preview-eww)
(use-package markdown-preview-mode)

;; UNCOMMENT THIS IF ON A FRESH INSTALL:
;;(package-refresh-contents)

;; -------------- END OF PACKAGES CONFIG --------------
;; ----------------------------------------------------

;; ----- Theming! We can disable a lot of things to make emacs prettier -----
(require 'match-region-to-cursor)
(load-theme 'doom-horizon t)

;; On Linux:
;;(add-to-list 'default-frame-alist '(font . "DejaVuSansMono-15"))
(set-face-attribute 'default nil :height 170)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq ring-bell-function 'ignore)
(setq-default show-trailing-whitespace t)

(setq gdb-many-windows 't)

(provide 'config)
