(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-topleft-v1)
  :bind
  ("C-c g" . magit)
  (:map magit-status-mode-map
        ("q" . (lambda () (interactive) (magit-mode-bury-buffer 16)))))

(use-package vc-hooks
  :ensure nil
  :after magit
  :custom
  (vc-handled-backends nil))

(use-package transient
  :after magit
  :config
  (transient-bind-q-to-quit))

(dependencies! git)
