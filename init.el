;; Initialize MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(package-refresh-contents)
(package-install 'aggressive-indent)
(package-install 'atom-one-dark-theme)
(package-install 'cider)
(package-install 'company)
(package-install 'company-c-headers)
(package-install 'company-jedi)
(package-install 'dashboard)
(package-install 'elcord)
(package-install 'evil)
(package-install 'evil-escape)
(package-install 'evil-leader)
(package-install 'evil-magit)
(when (equal system-type 'darwin)
  (package-install 'exec-path-from-shell))
(package-install 'flycheck)
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'magit)
(package-install 'projectile)
(package-install 'rainbow-delimiters)
(package-install 'smartparens)


;; Initialize load path
(defvar config-dir
  (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path config-dir)

(setq custom-file
	  (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;; Mac related settings
(when (equal system-type 'darwin)
  (setq mac-function-modifier 'meta)
  (setq mac-option-modifier nil)
  (setq ns-use-srgb-colorspace nil)
  (exec-path-from-shell-initialize))


;; Load files
(load "config-interface.el")
(load "config-programming.el")
(load "config-project.el")
(load "config-bindings.el")
