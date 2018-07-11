;; Evil related settings
(setq-default evil-want-integration nil)

(require 'evil-escape)
(setq evil-escape-key-sequence "  ")
(setq evil-escape-delay .5)
(setq evil-escape-unordered-key-sequence t)
(evil-escape-mode t)

(require 'evil-leader)
(evil-leader/set-leader ";")
(global-evil-leader-mode)

(require 'evil)
(setq evil-move-cursor-back nil)
(setq evil-normal-state-cursor '(box "#528FFF"))
(setq evil-insert-state-cursor '(box "#FFFFFF"))
(setq evil-visual-state-cursor '(box "#9FFF4C"))
(setq evil-replace-state-cursor '(box "#FF7C4C"))
(setq evil-operator-state-cursor '(hollow "#528FFF"))


;; Evil states unbinds
(define-key evil-normal-state-map (kbd "J") nil)
(define-key evil-motion-state-map (kbd "SPC") nil)


;; Leader key sequence
(evil-leader/set-key
	evil-leader/leader 'helm-M-x
	"bb" 'helm-mini
	"bf" 'helm-for-files
	"bg" 'helm-occur
	"gg" 'magit
	"gs" 'magit-stage-file
	"gc" 'magit-commit
	"gp" 'magit-push
	"pp" 'helm-projectile
	"pf" 'helm-projectile-find-file
	"pg" 'helm-projectile-grep
	"ws" 'split-window-below
	"wv" 'split-window)


;; Normal state bindings
(define-key evil-normal-state-map (kbd "C-p") 'evil-prev-buffer)
(define-key evil-normal-state-map (kbd "C-n") 'evil-next-buffer)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)


;; Motion state bindings
(define-key evil-motion-state-map (kbd "H") 'evil-first-non-blank)
(define-key evil-motion-state-map (kbd "J") 'evil-forward-paragraph)
(define-key evil-motion-state-map (kbd "K") 'evil-backward-paragraph)
(define-key evil-motion-state-map (kbd "L") 'evil-end-of-visual-line)


;; Insert state bindings
(define-key evil-insert-state-map (kbd "S-SPC") 'company-complete)


;; Special map bindings
(require 'company)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<tab>") #'company-select-next)
  (define-key company-active-map (kbd "<backtab>") #'company-select-previous))

(require 'helm)
(with-eval-after-load 'helm
  (define-key helm-map (kbd "<tab>") 'helm-next-line)
  (define-key helm-map (kbd "<backtab>") 'helm-previous-line))

(require 'magit)
(with-eval-after-load 'magit
  (define-key magit-mode-map (kbd "K") 'evil-backward-paragraph))

(provide 'config-bindings)
