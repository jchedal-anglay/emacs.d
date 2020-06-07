(use-package clojure-mode
  :hook
  (clojure-mode . aggressive-indent-mode))

(use-package cider
  :bind
  (:map cider-repl-mode-map
        ("C-l" . cider-repl-clear-buffer))
  :custom
  (cider-font-lock-dynamically t)
  (cider-print-fn 'fipp)
  (cider-repl-display-help-banner nil)
  (cider-repl-pop-to-buffer-on-connect t)
  (cider-repl-tab-command 'indent-for-tab-command)
  (cider-save-file-on-load t)
  (nrepl-hide-special-buffers t))

(dependencies! lein)
