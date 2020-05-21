(use-package aggressive-indent
  :config
  (add-to-list 'aggressive-indent-excluded-modes 'c++-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'c-mode)
  (global-aggressive-indent-mode))
