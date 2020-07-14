(use-package tex
  :ensure auctex
  :custom
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-method 'synctex)
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-view-program-selection '((output-pdf "PDF Tools")) TeX-source-correlate-start-server t)
  :config
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))

(with-module! :editor company
  (use-package company-auctex
    :after
    (company tex)
    :config
    (company-auctex-init))
  (add-hook 'TeX-mode-hook #'company-mode))

(use-package auctex-latexmk
  :after tex
  :custom
  (auctex-latexmk-inherit-TeX-PDF-mode t)
  :config
  (auctex-latexmk-setup))
