(use-package sly
  :bind
  (:map sly-mrepl-mode-map
        ("C-l" . sly-mrepl-clear-repl)
        ("C-c M-o" . nil)
        ("C-c C-o" . nil))
  :custom
  (inferior-lisp-program "sbcl")
  (sly-kill-without-query-p t)
  (sly-net-coding-system 'utf-8-unix)
  (sly-complete-symbol-function 'sly-simple-completions)
  (sly-mrepl-pop-sylvester nil)
  :config
  (sly-setup)
  ;; Hack to override the :clear-repl-history listener
  (sly-define-channel-method listener :clear-repl-history ()
    (with-current-buffer (sly-channel-get self 'buffer)
      (let ((inhibit-read-only t))
        (erase-buffer)))))

(with-module! :editor company
  (add-hook 'sly-mode-hook #'company-mode))

;; TODO: Add overlays, method used for elisp doesn't work

(dependencies! sbcl)
