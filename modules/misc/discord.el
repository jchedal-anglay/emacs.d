(use-package elcord
  :if (executable-find "discord")
  :custom
  (elcord-use-major-mode-as-main-icon t)
  :config
  (elcord-mode t))
