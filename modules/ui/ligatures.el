(use-package fira-code-mode
  :if (display-graphic-p)
  :hook
  (prog-mode . fira-code-mode)
  :custom
  (fira-code-mode-disabled-ligatures '("x" "lambda"))
  :config
  (unless (x-list-fonts "Fira Code")
    (fira-code-mode-install-fonts t)))
