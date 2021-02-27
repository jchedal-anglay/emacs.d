(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(with-feature! +variant
  (set-font-lock! negation-char     :foreground red)
  (set-font-lock! type              :foreground yellow)
  (set-font-lock! comment-delimiter :foreground light-grey)
  (set-font-lock! doc               :foreground light-grey)
  (set-font-lock! function-name     :foreground blue)
  (set-font-lock! constant          :foreground violet)
  (set-font-lock! warning           :foreground orange)
  (set-font-lock! keyword           :foreground magenta)
  (set-font-lock! string            :foreground green)
  (set-font-lock! variable-name     :foreground red)
  (set-font-lock! preprocessor      :foreground teal)
  (set-font-lock! builtin           :foreground blue))

(with-eval-after-load 'lsp-headerline
  (set-face! lsp-headerline-breadcrumb-symbols :foreground blue)
  (set-face! lsp-headerline-breadcrumb-path :foreground yellow))

(with-eval-after-load 'org
  (set-face-attribute 'org-level-1
                      nil
                      :background (face-background 'default)
                      :height 1.0))

(with-eval-after-load 'ivy-posframe
  (set-face-attribute 'ivy-posframe-border nil :background (doom-color 'fg))
  (set-face-attribute 'ivy-posframe nil :background (doom-color 'bg)))
