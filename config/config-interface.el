;; Default interface off
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


;; No prompt on exit
(setq confirm-kill-emacs nil)
(setq confirm-kill-processes nil)


;; UTF-8 settings
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; Text appearance
(set-frame-font "Inconsolata-16" nil t)
(require 'atom-one-dark-theme)
(load-theme 'atom-one-dark t)
(custom-set-faces
   '(font-lock-doc-face ((t (:inherit 'font-lock-comment-face :slant italic))))
   '(font-lock-variable-name-face ((t (:foreground "#D6BDDB")))))


;; Welcome screen
(require 'dashboard)
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents  . 5)
						(bookmarks . 5)
						(projects . 5)))
(dashboard-setup-startup-hook)


;; Syntax highlighting
(font-lock-add-keywords 'prog-mode '(("\\(TODO\\|FIXME\\|BUG\\):" 1 'font-lock-function-name-face t)))
(font-lock-add-keywords 'python-mode '(("\\<\\([^A-Z][\\w_]+\\)(" 1 'font-lock-function-name-face t)))
(font-lock-add-keywords 'python-mode '(("\\<\\([A-Z][\\w_]+\\)(" 1 'font-lock-type-face t)))
(font-lock-add-keywords 'python-mode '(("`\\(.+\\)[`']" 1 'font-lock-builtin-face)))


;; Miscellaneous settings
(setq auto-save-default nil)
(setq completion-ignore-case t)
(setq make-backup-files nil)
(setq read-file-name-completion-ignore-case t)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(blink-cursor-mode -1)
(show-paren-mode t)

(provide 'config-interface)
