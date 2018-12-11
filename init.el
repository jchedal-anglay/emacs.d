;; MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Initialize use-package
(package-refresh-contents)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq-default use-package-always-ensure t)

;; MacOS settings
(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :config
	(exec-path-from-shell-initialize)))

;; Variables settings
(defconst custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (not (file-exists-p custom-file))
  (write-region "" nil custom-file))
(load custom-file)

;; Appearance
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Columns/Lines
(line-number-mode t)
(column-number-mode t)

;; Better scrolling
(setq scroll-margin 0)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position t)
(setq mouse-wheel-progressive-speed nil)

;; Better prompt
(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs nil)

;; UTF-8 settings
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Text appearance
(set-frame-font "Inconsolata-12" nil t)

;; Line numbers
(setq-default linum-format " %d ")
(add-hook 'prog-mode-hook (lambda ()
			    (if (version<= "26.0.50" emacs-version)
				(global-display-line-numbers-mode)
			      (linum-mode))
			    (set-face-underline 'linum nil)))

;; Miscellaneous settings
(setq auto-save-default nil)
(setq completion-ignore-case t)
(setq make-backup-files nil)
(setq read-file-name-completion-ignore-case t)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(global-subword-mode 1)
(show-paren-mode t)
(blink-cursor-mode -1)
(delete-selection-mode t)

;; Xah-fly-keys settings
(use-package xah-fly-keys
  :init
  (defun bindkey-insert-mode ()
    (interactive)
    (define-key xah-fly-key-map (kbd "S-SPC") 'company-complete)
    (define-key xah-fly-key-map (kbd "<backtab>") 'tab-to-tab-stop))
  (defun bindkey-command-mode ()
    (interactive)
    (define-key xah-fly-key-map (kbd ";") 'keyboard-escape-quit)
    (define-key xah-fly-key-map (kbd "'") 'xah-comment-dwim)
    (define-key xah-fly-key-map (kbd "b") 'helm-occur))
  (add-hook 'xah-fly-insert-mode-activate-hook 'bindkey-insert-mode)
  (add-hook 'xah-fly-command-mode-activate-hook 'bindkey-command-mode)
  :config
  (xah-fly--define-keys
   (define-prefix-command 'xah-fly-leader-key-map)
   '(("SPC" . helm-mini)
     ("y" . er/expand-region) ; t
     ("q" . (lambda () (interactive) (if (one-window-p) (kill-emacs) (delete-window)))) ; x
     ("j" . (lambda () (interactive) (delete-trailing-whitespace) (save-buffer))) ; c
     ("k" . helm-find-files) ; v
     ))
  (global-set-key (kbd "<escape>") 'xah-fly-command-mode-activate)
  (setq xah-fly-use-control-key nil)
  (setq xah-fly-use-meta-key nil)
  (xah-fly-keys 1))

(use-package dashboard
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1))

(use-package expand-region)

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(use-package rainbow-delimiters)

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark t)
  (custom-set-faces
   '(font-lock-variable-name-face ((t (:foreground "#D6BDDB"))))))

(use-package flycheck
  :config
  (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
    (vector #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00111000
	    #b01111100
	    #b11111110
	    #b11111110
	    #b11111110
	    #b01111100
	    #b00111000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000
	    #b00000000))
  (flycheck-define-error-level 'info
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-info
    :info-list-face 'flycheck-error-list-info)
  (flycheck-define-error-level 'warning
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-warning
    :warning-list-face 'flycheck-error-list-warning)
  (flycheck-define-error-level 'error
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-error
    :error-list-face 'flycheck-error-list-error)
  (custom-set-faces
   '(flycheck-info ((t (:underline (:style line :color "#80FF80")))))
   '(flycheck-warning ((t (:underline (:style line :color "#FF9933")))))
   '(flycheck-error ((t (:underline (:style line :color "#FF5C33"))))))
  (flycheck-define-checker python-mypy ""
			   :command ("mypy"
				     "--ignore-missing-imports" "--python-version" "3.7"
				     "--hide-error-context" "--no-strict-optional"
				     source-original)
			   :error-patterns
			   ((error line-start (file-name) ":" line ": error:" (message) line-end))
			   :modes python-mode)
  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (global-flycheck-mode t))

(use-package helm
  :init
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "TAB") 'helm-next-line)
    (define-key helm-map (kbd "<backtab>") 'helm-previous-line))
  :config
  (setq helm-boring-file-regexp-list
	'("\\.$" "\\.git*." "\\.o" "\\.a$" "\\.pyc$" "\\.pyo$" "/Library/?" "/Applications/?"))
  (setq helm-display-header-line nil)
  (helm-mode t))

(use-package helm-projectile
  :config
  (projectile-mode t)
  (helm-projectile-on))

(use-package company
  :init
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "S-SPC") 'company-abort)
    (define-key company-active-map (kbd "TAB") 'company-select-next)
    (define-key company-active-map (kbd "<backtab>") 'company-select-previous))
  :config
  (setq company-idle-delay 120)
  (global-company-mode t)
  (custom-set-faces
   '(company-tooltip ((t (:foreground "#ABB2BF" :background "#30343C"))))
   '(company-tooltip-annotation ((t (:foreground "#ABB2BF" :background "#30343C"))))
   '(company-tooltip-selection ((t (:foreground "#ABB2BF" :background "#393F49"))))
   '(company-tooltip-mouse ((t (:background "#30343C"))))
   '(company-tooltip-common ((t (:foreground "#ABB2BF" :background "#30343C"))))
   '(company-tooltip-common-selection ((t (:foreground "#ABB2BF" :background "#393F49"))))
   '(company-preview ((t (:background "#30343C"))))
   '(company-preview-common ((t (:foreground "#ABB2BF" :background "#30343C"))))
   '(company-scrollbar-fg ((t (:background "#30343C"))))
   '(company-scrollbar-bg ((t (:background "#30343C"))))
   '(company-template-field ((t (:foreground "#282C34" :background "#C678DD"))))))

(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-jedi
  :config
  (add-to-list 'company-backends 'company-jedi))

(use-package magit)

(use-package prog-mode
  :ensure nil
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package cc-mode
  :ensure nil
  :init
  (add-hook 'c-mode-hook (lambda ()
			   (setq indent-tabs-mode t)
			   (global-aggressive-indent-mode -1)))
  :config
  (setq-default c-default-style "linux")
  (setq-default c-basic-offset 4))
(use-package python
  :ensure nil
  :init
  (add-hook 'python-mode-hook (lambda ()
				(setq flycheck-python-pylint-executable "python3.7")
				(setq flycheck-python-pycompile-executable "python3.7")))
  :config
  (setq-default python-shell-interpreter "python3")
  (setq-default python-indent 4))

(use-package tuareg
  :config
  (setq tuareg-match-patterns-aligned t)
  (setq tuareg-indent-align-with-first-arg t))
