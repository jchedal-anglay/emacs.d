(with-os! (gnu/linux darwin)
  (use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize)))
