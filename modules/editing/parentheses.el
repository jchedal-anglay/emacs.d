(use-package elec-pair
  :ensure nil
  :hook
  (prog-mode . electric-pair-mode))

(show-paren-mode t)

(use-package rainbow-delimiters
  :if (feature-p! +rainbow)
  :hook
  (prog-mode . rainbow-delimiters-mode))
