;;; core-ui.el --- Core module that defines basic UI settings -*- lexical-binding: t -*-
;;; Commentary:
;; Defines UI elements such as the modeline or the dashboard.
;;; Code:

(defun igneous--banner-logo-title ()
  (setq dashboard-banner-logo-title
	(format "%d modules loaded within %d categories."
		(length igneous--modules)
		(length (igneous--categories)))))

(use-package dashboard
  :demand t
  :if (display-graphic-p)
  :bind
  (:map dashboard-mode-map
        ("C-n" . widget-forward)
        ("C-p" . widget-backward))
  :hook
  (after-init . igneous--banner-logo-title)
  :custom
  (dashboard-center-content t)
  (dashboard-items '((recents  . 5)))
  (dashboard-set-file-icons nil)
  (dashboard-set-footer nil)
  (dashboard-set-heading-icons nil)
  (dashboard-set-init-info t)
  (dashboard-set-navigator nil)
  (dashboard-startup-banner 'logo)
  :config
  (dashboard-setup-startup-hook))

(line-number-mode t)
(column-number-mode t)

(use-package hide-mode-line
  :hook
  ((comint-mode help-mode) . hide-mode-line-mode))

(use-package display-line-numbers
  :ensure nil
  :hook
  (prog-mode . display-line-numbers-mode)
  :custom
  (display-line-numbers-type 'relative)
  (display-line-numbers-current-absolute t)
  (display-line-numbers-width 2)
  (display-line-numbers-widen t))

(provide 'core-ui)
;;; core-ui.el ends here
