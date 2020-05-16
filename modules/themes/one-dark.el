(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(with-feature! +variant
  (set-face-attribute 'font-lock-keyword-face
                      nil
                      :foreground (doom-color 'red)))

(with-eval-after-load 'org
  (set-face-attribute 'org-level-1
                      nil
                      :background (face-background 'default)
                      :height 1.0))
