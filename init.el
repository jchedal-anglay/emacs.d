;; MELPA repository
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(package-refresh-contents)
(package-install 'aggressive-indent)
(package-install 'atom-one-dark-theme)
(package-install 'company)
(package-install 'company-c-headers)
(package-install 'company-jedi)
(package-install 'dashboard)
(package-install 'flycheck)
(package-install 'golden-ratio)
(package-install 'helm)
(package-install 'helm-projectile)
(package-install 'multiple-cursors)
(package-install 'magit)
(package-install 'rainbow-delimiters)
(package-install 'smartparens)
(package-install 'xah-fly-keys)
(package-install 'yasnippet-snippets)

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Bindings
(require 'xah-fly-keys)
(setq xah-fly-use-control-key nil)

(defun bindkey-insert-mode ()
  "Define keys for `xah-fly-insert-mode-activate-hook'."
  (interactive)
  (setq cursor-type 'box)
  (hl-line-mode 1)
  (blink-cursor-mode -1)
  (define-key xah-fly-key-map (kbd "e") 'self-insert-command)
  (define-key xah-fly-key-map (kbd "b") 'self-insert-command)
  (define-key xah-fly-key-map (kbd "y") 'self-insert-command)
  (define-key xah-fly-key-map (kbd "<escape>") 'xah-fly-command-mode-activate))

(defun bindkey-command-mode ()
  "Define keys for `xah-fly-command-mode-activate-hook'."
  (interactive)
  (hl-line-mode 0)
  (define-key xah-fly-key-map (kbd "e") 'delete-backward-char)
  (define-key xah-fly-key-map (kbd "b") 'isearch-forward-regexp)
  (define-key xah-fly-key-map (kbd "'") 'keyboard-escape-quit)
  (define-key xah-fly-key-map (kbd "y") 'rectangle-mark-mode))

(add-hook 'xah-fly-insert-mode-activate-hook 'bindkey-insert-mode)
(add-hook 'xah-fly-command-mode-activate-hook 'bindkey-command-mode)

(defun smart-save ()
  "Save the buffer and remove trailing whitespaces."
  (interactive)
  (delete-trailing-whitespace)
  (save-buffer))

(defun smart-quit (&optional flag)
  "Kill the buffer and window, if FLAG is t, save the current buffer."
  (interactive)
  (when flag
    (smart-save))
  (if (one-window-p)
      (kill-emacs)
    (delete-window)))

(xah-fly--define-keys
 (define-prefix-command 'alternative-map)
 '(("u" . helm-for-files)
   ("i" . magit-status)
   ("b" . helm-occur)
   ))

(xah-fly--define-keys
 (define-prefix-command 'projectile-key-map)
 '(("y" . mc/mark-all-like-this)
   ("u" . helm-projectile-find-file) ; f
   ("i" . helm-projectile) ; g
   ("b" . helm-projectile-grep) ; n
   ))

(xah-fly--define-keys
 (define-prefix-command 'xah-fly-leader-key-map)
 '(("SPC" . alternative-map)
   ("5" . kill-line)
   ("'" . nil) ; q
   ("," . nil) ; w
   ("." . nil) ; e
   ("p" . nil) ; r
   ("y" . mc/edit-lines) ; t
   ("f" . nil) ; y
   ("g" . nil) ; u
   ("c" . nil) ; i
   ("r" . nil) ; o
   ("l" . nil) ; p
   ("a" . nil) ; a
   ("o" . nil) ; s
   ("e" . nil) ; d
   ("u" . nil) ; f
   ("i" . projectile-key-map) ; g
   ("d" . beginning-of-buffer) ; h
   ("h" . beginning-of-line) ; j
   ("t" . nil) ; k
   ("n" . end-of-line) ; l
   ("s" . end-of-buffer) ; ;
   (";" . nil) ; z
   ("q" . smart-quit) ; x
   ("j" . smart-save) ; c
   ("k" . helm-find-files) ; v
   ("x" . helm-mini) ; b
   ("b" . xah-search-current-word) ; n
   ("m" . nil) ; m
   ("w" . nil) ; ,
   ("v" . nil) ; .
   ("z" . nil) ; /
   ))

(xah-fly-keys 1)

(global-set-key (kbd "C-u") 'isearch-repeat-backward)
(global-set-key (kbd "C-h") 'isearch-repeat-forward)
(global-set-key (kbd "S-SPC") (lambda () (interactive) (when xah-fly-insert-state-q (company-complete))))
(global-set-key (kbd "<backtab>") 'tab-to-tab-stop)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Appearance
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Golden ratio
(require 'golden-ratio)
(golden-ratio-mode 1)

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

;; No prompt on exit
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
							(linum-mode)
							(set-face-underline 'linum nil)))

;; Welcome screen
(require 'dashboard)
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents  . 5)
						(bookmarks . 5)
						(projects . 5)))
(dashboard-setup-startup-hook)

;; Miscellaneous settings
(setq auto-save-default nil)
(setq completion-ignore-case t)
(setq make-backup-files nil)
(setq read-file-name-completion-ignore-case t)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(show-paren-mode t)
(blink-cursor-mode -1)
(delete-selection-mode t)

;; Aggressive Indent
(require 'aggressive-indent)
(global-aggressive-indent-mode 1)

;; Smartparens
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

;; Rainbow Delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Atom One Dark
(require 'atom-one-dark-theme)
(load-theme 'atom-one-dark t)
(custom-set-faces
 '(font-lock-variable-name-face ((t (:foreground "#D6BDDB")))))

;; Flycheck
(require 'flycheck)
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
								   "--ignore-missing-imports" "--fast-parser"
								   "--python-version" "3.6" "--hide-error-context"
								   "--no-strict-optional"
								   source-original)
						 :error-patterns
						 ((error line-start (file-name) ":" line ": error:" (message) line-end))
						 :modes python-mode)
(add-to-list 'flycheck-checkers 'python-mypy t)
(flycheck-add-next-checker 'python-pylint 'python-mypy t)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(global-flycheck-mode t)

;; Helm
(require 'helm)
(with-eval-after-load 'helm
  (define-key helm-map (kbd "<tab>") 'helm-next-line)
  (define-key helm-map (kbd "<backtab>") 'helm-previous-line))
(setq helm-boring-file-regexp-list
      '("\\.$" "\\.git*." "\\.o" "\\.a$" "\\.pyc$" "\\.pyo$" "/Library/?" "/Applications/?"))
(setq helm-display-header-line nil)
(helm-mode t)

;; Projectile
(require 'helm-projectile)
(projectile-mode t)
(helm-projectile-on)

;; Company
(require 'company)
(require 'company-c-headers)
(require 'company-jedi)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "S-SPC") 'company-abort)
  (define-key company-active-map (kbd "<tab>") 'company-select-next)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))
(setq company-idle-delay 120)
(add-to-list 'company-backends 'company-jedi)
(add-to-list 'company-backends 'company-c-headers)
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
 '(company-template-field ((t (:foreground "#282C34" :background "#C678DD")))))

;; Magit
(require 'magit)
(with-eval-after-load 'magit
  (define-key magit-mode-map (kbd "c") 'magit-commit)
  (define-key magit-mode-map (kbd "p") 'magit-push))

;; Yasnippet
(require 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "C-SPC") 'yas-expand)

;; General programming settings
(add-hook 'prog-mode-hook (lambda()
							(setq tab-width 4)))

;; C settings
(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook (lambda()
						 (setq indent-tabs-mode t)))

;; Python settings
(setq-default python-shell-interpreter "python3")
(setq-default python-indent 4)
(add-hook 'python-mode-hook (lambda()
							  (setq flycheck-python-pylint-executable "python3")
							  (setq flycheck-python-pycompile-executable "python3")))
