;;; Initialize MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(package-refresh-contents)
(package-install 'atom-one-dark-theme)
(package-install 'company)
(package-install 'company-c-headers)
(package-install 'company-jedi)
(package-install 'dashboard)
(package-install 'evil)
(package-install 'evil-escape)
(package-install 'evil-leader)
(package-install 'evil-magit)
(package-install 'exec-path-from-shell)
(package-install 'flycheck)
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'magit)
(package-install 'projectile)
(package-install 'rainbow-delimiters)


;;; Initialize load path
(defvar config-dir
  (expand-file-name "config" user-emacs-directory))
(add-to-list 'load-path config-dir)

(setq custom-file
	  (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;;; Garbage collector
(let ((normal-gc-cons-threshold (* 20 1024 1024))
	  (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
			(lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;;; Mac related settings
(when (equal system-type 'darwin)
  (setq mac-function-modifier 'meta)
  (setq mac-option-modifier nil)
  (setq ns-use-srgb-colorspace nil)
  (exec-path-from-shell-initialize))


(load "config-interface.el")
(load "config-programming.el")
(load "config-project.el")
(load "config-bindings.el")
