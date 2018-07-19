;; Helm settings
(require 'helm)
(setq helm-boring-file-regexp-list '("\\.$" "\\.git*." "\\.o"
									 "\\.a$" "\\.pyc$" "\\.pyo$"
									 "/Library/?" "/Applications/?"))
(helm-mode t)


;; Magit settings
(require 'evil-magit)
(setq magit-refresh-status-buffer nil)
(setq magit-diff-highlight-indentation nil)
(setq magit-diff-highlight-trailing nil)
(setq magit-diff-paint-whitespace nil)
(setq magit-diff-highlight-hunk-body nil)
(setq magit-diff-refine-hunk nil)
(setq magit-revision-insert-related-refs nil)
(remove-hook 'server-switch-hook 'magit-commit-diff)
(remove-hook 'magit-refs-sections-hook 'magit-insert-tags)
(setq vc-handled-backends nil)


(evil-magit-init)


;; Projectile settings
(require 'helm-projectile)
(projectile-mode t)
(helm-projectile-on)


(provide 'config-project)
