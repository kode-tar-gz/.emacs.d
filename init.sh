#!/bin/sh

emacs_dir="~/.emacs.d/"
package_init_fn="
(require 'package)\
(add-to-list 'package-archives\
             '(\"melpa\" . \"https://melpa.org/packages/\"))\
(package-initialize)\
(package-refresh-contents)"

emacs --batch --eval "$package_init_fn" --load $emacs_dir/init.el
