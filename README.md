# .emacs.d

My personal Emacs config.
The main config file is `config.el`. I used to have a `config.org` file (blindly following [dt](https://www.youtube.com/distrotube)'s advice for much longer than I'd like to admit), but I've since migrated to a simpler, cleaner setup.

I also have my own tiny minor mode in `kode-mode.el`, which I mostly only use for overriding keybindings to ones that make more sense to me, some of which use custom functions. There's probably a better way of doing this than creating an entire mode, but this is the first option I found that actually worked.

***DISCLAIMER***: A lot of the custom helper functions in kode-mode.el are made with the help of generative AI. I'm no Elisp wizard sadly, but I still had things I wanted to get done without spending hours learning hidden emacs functions.

## Installation
My config depends on many packages, some of which are fully custom and aren't on MELPA or ELPA or anything of the sort *(yet!)*:
- [chasm-mode](https://github.com/kode-tar-gz/chasm-mode)
- [compuni](https://github.com/kode-tar-gz/compuni)

Thus, you should get these packages yourself and put them in `lisp/`.
Then, you can run `init.sh` to run the config files for the first time, installing all necessary packages. Once that's done you can finally open Emacs and start hacking.
