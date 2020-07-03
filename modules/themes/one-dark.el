(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(with-feature! +variant
  (set-face! negation-char     :foreground red)
  (set-face! comment           :foreground grey)
  (set-face! type              :foreground yellow)
  (set-face! comment-delimiter :foreground grey)
  (set-face! doc               :foreground grey)
  (set-face! function-name     :foreground blue)
  (set-face! constant          :foreground violet)
  (set-face! warning           :foreground orange)
  (set-face! keyword           :foreground magenta)
  (set-face! string            :foreground green)
  (set-face! variable-name     :foreground red)
  (set-face! preprocessor      :foreground teal)
  (set-face! builtin           :foreground blue))

(with-eval-after-load 'org
  (set-face-attribute 'org-level-1
                      nil
                      :background (face-background 'default)
                      :height 1.0))
