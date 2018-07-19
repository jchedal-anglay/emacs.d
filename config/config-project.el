;; Helm settings
(require 'helm)
(setq helm-boring-file-regexp-list '("\\.$" "\\.git*." "\\.o"
									 "\\.a$" "\\.pyc$" "\\.pyo$"
									 "/Library/?" "/Applications/?"))
(helm-mode t)


;; Magit settings
(require 'evil-magit)
(evil-magit-init)


;; Projectile settings
(require 'helm-projectile)
(projectile-mode t)
(helm-projectile-on)


(provide 'config-project)
