#!/bin/sh

emacs_dir="~/.emacs.d/"

emacs --batch -f 'package-refresh-contents' --load $emacs_dir/init.el
