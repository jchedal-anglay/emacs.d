(use-package elec-pair
  :ensure nil
  :hook
  (prog-mode . electric-pair-mode))

(show-paren-mode t)

(with-feature! +rainbow
  (use-package rainbow-delimiters
    :hook
    (prog-mode . rainbow-delimiters-mode)))

