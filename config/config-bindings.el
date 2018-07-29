;; Evil related settings
(setq-default evil-want-integration nil)

(require 'evil-escape)
(setq evil-escape-key-sequence "jk")
(setq evil-escape-delay .05)
(setq evil-escape-unordered-key-sequence t)
(evil-escape-mode t)

(require 'evil-leader)
(evil-leader/set-leader "SPC")
(global-evil-leader-mode)

(require 'evil)
(setq evil-move-cursor-back nil)
(setq evil-normal-state-cursor '(box "#528FFF"))
(setq evil-insert-state-cursor '(box "#FFFFFF"))
(setq evil-visual-state-cursor '(box "#9FFF4C"))
(setq evil-replace-state-cursor '(box "#FF7C4C"))
(setq evil-operator-state-cursor '(hollow "#528FFF"))
(evil-mode t)


;; Global bindings
(define-key global-map (kbd "M-x") 'helm-M-x)


;; Evil states unbinds
(define-key evil-normal-state-map (kbd "J") nil)
(define-key evil-motion-state-map (kbd "SPC") nil)


;; Leader key sequence
(evil-leader/set-key
  "SPC" 'helm-M-x
  "b" 'helm-mini
  "f" 'helm-find-files
  "g" 'magit
  "h" 'windmove-left
  "j" 'windmove-down
  "k" 'windmove-up
  "l" 'windmove-right
  "p" 'helm-projectile
  "q" 'evil-quit
  "w" 'save-buffer
  "x" 'evil-save-and-close
  "/" 'helm-occur
  "?" (lambda ()
		(interactive)
		(if (projectile-project-p)
			(helm-projectile-grep)
		  (helm-for-files))))


;; Motion state bindings
(define-key evil-motion-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-motion-state-map (kbd "J") 'evil-forward-section-begin)
(define-key evil-motion-state-map (kbd "K") 'evil-backward-section-begin)
(define-key evil-motion-state-map (kbd "L") 'evil-end-of-visual-line)


;; Insert state bindings
(define-key evil-insert-state-map (kbd "S-SPC") 'company-complete)
(define-key evil-insert-state-map (kbd "<backtab>") 'tab-to-tab-stop)


;; Special map bindings
(require 'company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "jk") (lambda () (interactive) (company-abort) (evil-escape)))
  (define-key company-active-map (kbd "kj") (lambda () (interactive) (company-abort) (evil-escape)))
  (define-key company-active-map (kbd "S-SPC") 'company-abort)
  (define-key company-active-map (kbd "<tab>") 'company-select-next)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))

(require 'helm)
(with-eval-after-load 'helm
  (define-key helm-map (kbd "<tab>") 'helm-next-line)
  (define-key helm-map (kbd "<backtab>") 'helm-previous-line))

(require 'magit)
(with-eval-after-load 'magit
  (define-key magit-mode-map (kbd "J") 'evil-forward-paragraph)
  (define-key magit-mode-map (kbd "K") 'evil-backward-paragraph))

(provide 'config-bindings)
