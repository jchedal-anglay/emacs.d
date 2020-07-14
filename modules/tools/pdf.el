(use-package pdf-tools
  :if (memq system-type '(gnu/linux darwin))
  :hook
  (pdf-tools-enabled . pdf-view-midnight-minor-mode)
  :bind
  (:map pdf-view-mode-map
        ("C-s" . isearch-forward)
        ("C-r" . isearch-backward))
  :custom
  (pdf-view-display-size 'fit-page)
  (pdf-annot-activate-created-annotations t))
