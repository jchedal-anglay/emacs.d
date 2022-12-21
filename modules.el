(load! :editor
       company
       editorconfig
       expand-region
       flycheck
       hungry-delete
       multiple-cursors
       (parentheses +rainbow)
       project
       :input
       dvorak
       :language
       (cc +lsp)
       clojure
       common-lisp
       emacs-lisp
       (python +cython +lsp)
       latex
       :misc
       discord
       exec-path-from-shell
       keyfreq
       :os
       macos
       :themes
       (one-dark +variant)
       ;; solarized-light
       :tools
       git
       (lsp +ui +debug)
       pdf
       vterm
       :ui
       (modeline +doom)
       (discoverability)
       icons
       ;; ligatures
       ;; (ivy +swiper +posframe)
       vertico)
