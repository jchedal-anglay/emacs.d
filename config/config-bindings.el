;; Evil related settings
(setq-default evil-want-integration nil)

(require 'evil-escape)
(setq evil-escape-key-sequence "  ")
(setq evil-escape-delay .5)
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


;; Evil states unbinds
(define-key evil-motion-state-map (kbd "SPC") nil)
(define-key evil-normal-state-map (kbd "J") nil)


;; Leader key sequence
(evil-leader/set-key
  "bb" 'helm-mini
  "bg" 'helm-occur
  "bs" (lambda () (interactive) (switch-to-buffer "*scratch*"))
  "ff" 'helm-find-files
  "fg" 'helm-for-files
  "fq" 'evil-quit
  "fs" (lambda () (interactive) (delete-trailing-whitespace) (save-buffer))
  "gb" 'magit-checkout
  "gc" 'magit-commit
  "gg" 'magit
  "gi" 'magit-init
  "gm" 'magit-merge
  "gp" 'magit-push
  "gs" 'magit-stage
  "gu" 'magit-unstage
  "pf" 'helm-projectile-find-file
  "pg" 'helm-projectile-grep
  "pp" 'helm-projectile
  "wh" 'windmove-left
  "wj" 'windmove-down
  "wk" 'windmove-up
  "wl" 'windmove-right
  "wn" 'next-buffer
  "wp" 'previous-buffer
  "ws" 'split-window-below
  "wv" 'split-window-right)


;; Normal state bindings
(define-key evil-normal-state-map (kbd "%") (lambda () (interactive) (evil-jump-item) (evil-visual-char) (evil-jump-item)))
(define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)


;; Motion state bindings
(define-key evil-motion-state-map (kbd "SPC SPC") 'evil-escape)
(define-key evil-motion-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-motion-state-map (kbd "J") 'evil-forward-paragraph)
(define-key evil-motion-state-map (kbd "K") 'evil-backward-paragraph)
(define-key evil-motion-state-map (kbd "L") 'evil-end-of-visual-line)


;; Insert state bindings
(define-key evil-insert-state-map (kbd "<backtab>") 'tab-to-tab-stop)
(define-key evil-insert-state-map (kbd "S-SPC") 'company-complete)


;; Specific map bindings
(require 'company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "SPC SPC") (lambda () (interactive) (company-abort)))
  (define-key company-active-map (kbd "<tab>") 'company-select-next)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))

(require 'helm)
(with-eval-after-load 'helm
  (define-key helm-map (kbd "<tab>") 'helm-next-line)
  (define-key helm-map (kbd "<backtab>") 'helm-previous-line))

(require 'magit)
(with-eval-after-load 'magit
  (define-key magit-mode-map (kbd "K") 'evil-backward-paragraph))

(provide 'config-bindings)
