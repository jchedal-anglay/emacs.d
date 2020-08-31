(use-package elcord
  :if (or (executable-find "discord") (executable-find "discord-canary"))
  :custom
  (elcord-use-major-mode-as-main-icon t)
  :config
  (elcord-mode t))
