(use-package python
  :ensure nil
  :custom
  (python-indent 4)
  (py-split-window-on-execute t))

;; Required for MacOS, prevents newlines from being displayed as ^G
(setq python-shell-interpreter-args (if (equal system-type 'darwin)
					"-c \"exec('__import__(\\'readline\\')')\" -i"
				      "-i"))

(use-package pyvenv
  :after python
  :hook
  (python-mode . pyvenv-mode))

(with-feature! +lsp
  (if (module-p! :tools lsp)
      (add-hook 'python-mode-hook #'lsp)
    (warn "Module language/python requires module tools/lsp for feature +lsp to work.")))
