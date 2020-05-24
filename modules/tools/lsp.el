(use-package lsp-mode
  :bind
  (:map lsp-mode-map
	([remap xref-find-definitions] . lsp-find-definition)
	("C-c e" . lsp-rename)
	("C-c f" . lsp-format-buffer))
  :custom
  (lsp-auto-guess-root t)
  (lsp-enable-snippet nil)
  (lsp-prefer-capf t))

(use-package lsp-ui
  :if (feature-p! +ui)
  :after lsp-mode
  :bind
  (:map lsp-mode-map
	([remap xref-find-references] . lsp-ui-peek-find-references)
	([remap flycheck-list-errors] . lsp-ui-flycheck-list))
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-doc-include-signature t)
  :config
  (with-eval-after-load 'hl-line
    (set-face-background 'lsp-ui-doc-background (face-background 'hl-line))))

(with-module! :editor company
  (add-hook 'lsp-mode-hook #'company-mode))
