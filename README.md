# .emacs.d

My personal Emacs config.
The main config file is config.el. I used to have a config.org file (blindly following [dt](https://www.youtube.com/distrotube)'s advice for much longer than I'd like to admit), but I've since migrated to a simpler, cleaner setup.

I also have my own tiny minor mode in kode-mode.el, which I mostly only use for overriding keybindings to ones that make more sense to me, some of which use custom functions. There's probably a better way of doing this than creating an entire mode, but this is the first option I found that actually worked.
***DISCLAIMER***: A lot of the custom helper functions in kode-mode.el are made with the help of generative AI. I'm no Elisp wizard (yet) sadly, but I still had things I wanted to get done without spending hours learning a new language.

## Packages
The packages listed in config.el automatically get installed on the first startup with the help of the helper function `ensure-package`. Thus, the first time you open Emacs with this config it can take a good 30 seconds or more to fully install everything. However, once that's done, you shouldn't ever have to worry about missing dependencies and the startup time will be much faster. Packages are loaded with `use-package`.
