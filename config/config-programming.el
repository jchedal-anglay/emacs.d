;; General programming settings
(add-hook 'prog-mode-hook (lambda()
							(setq tab-width 4)
							(linum-mode)
							(rainbow-delimiters-mode)))


;; Python settings
(setq-default python-shell-interpreter "python3.7")
(setq-default python-indent 4)
(add-hook 'python-mode-hook (lambda()
								(setq flycheck-python-pylint-executable "python3.7")
								(setq flycheck-python-pycompile-executable "python3.7")))


;; C settings
(setq-default c-default-style "linux")
(setq-default c-basic-offset 4)
(add-hook 'c-mode-hook (lambda()
						 (setq indent-tabs-mode t)))


;; Syntax checker
(require 'flycheck)
(global-flycheck-mode t)


;; Auto-completion
(require 'company)
(require 'company-c-headers)
(require 'company-jedi)
(setq company-idle-delay 60)
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

(provide 'config-programming)
