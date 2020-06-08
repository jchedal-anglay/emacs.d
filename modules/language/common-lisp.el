(use-package sly
  :custom
  (inferior-lisp-program "sbcl")
  (sly-kill-without-query-p t)
  (sly-net-coding-system 'utf-8-unix)
  (sly-complete-symbol-function 'sly-simple-completions)
  :config
  (sly-setup))

(with-module! :editor company
  (add-hook 'sly-mode-hook #'company-mode))

(dependencies! sbcl)
