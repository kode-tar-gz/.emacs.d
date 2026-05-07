(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'config)
(require 'kode-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   '(company-bbdb company-semantic company-cmake company-capf
		  company-c-headers company-clang company-abbrev
		  company-files
		  (company-dabbrev-code company-gtags company-etags
					company-keywords)
		  company-oddmuse company-dabbrev))
 '(magit-bury-buffer-function 'magit-restore-window-configuration)
 '(package-selected-packages nil))
 '(package-selected-packages nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
