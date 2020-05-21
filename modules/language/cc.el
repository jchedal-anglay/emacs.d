(setq c-default-style "k&r"
      c-basic-offset 4)

(with-feature! +lsp
  (if (module-p! :tools lsp)
      (progn (add-hook 'c-mode-hook #'lsp)
	     (add-hook 'c++-mode-hook #'lsp))
    (warn "Module language/cc requires module tools/lsp for feature +lsp to work.")))
