(use-package vterm
  :if (bound-and-true-p module-file-suffix)
  :preface (setq vterm-install t)
  :hook
  (vterm-mode . hide-mode-line-mode)
  :bind
  ("C-c t" . vterm)
  (:map vterm-mode-map
        ("C-DEL" . vterm-send-meta-backspace))
  :custom
  (vterm-kill-buffer-on-exit t))

(dependencies! cmake)
