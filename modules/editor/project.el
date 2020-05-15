(defun igneous--file-exists-p (path)
  (and (file-exists-p path) path))

(use-package projectile
  :demand t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-project-search-path (list (igneous--file-exists-p "~/Projects")))
  (projectile-indexing-method (if (memq system-type '(ms-dos windows-nt cygwin)) 'native 'alien))
  (projectile-sort-order 'access-time)
  (projectile-enable-caching t)
  (projectile-require-project-root t)
  (projectile-completion-system 'ivy)
  :config
  (projectile-mode t))

(use-package counsel-projectile
  :if (module-p! :ui ivy)
  :after
  (counsel projectile)
  :config
  (counsel-projectile-mode t))
