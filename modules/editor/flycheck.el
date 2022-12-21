(use-package flycheck
  :hook
  (prog-mode . flycheck-mode)
  :custom-face
  (flycheck-info ((t (:underline (:style line :color "#80FF80")))))
  (flycheck-warning ((t (:underline (:style line :color "#FF9933")))))
  (flycheck-error ((t (:underline (:style line :color "#FF5C33")))))
  :custom
  (flycheck-check-syntax-automatically '(mode-enabled save))
  (flycheck-checkers nil)
  :config
  ;; Bad flycheck design, override the default fringe without having to redefine entire checker levels
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [#b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111
     #b00000111]))
