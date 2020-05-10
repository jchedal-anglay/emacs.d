(with-os! darwin
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize))
  (setq mac-command-modifier 'meta))

