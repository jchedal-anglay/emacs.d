(use-package doom-modeline
  :demand t
  :if (and (display-graphic-p) (feature-p! +doom))
  :custom
  (doom-modeline-env-enable-elixir nil)
  (doom-modeline-env-enable-go nil)
  (doom-modeline-env-enable-perl nil)
  (doom-modeline-env-enable-python nil)
  (doom-modeline-env-enable-ruby nil)
  (doom-modeline-env-enable-rust nil)
  (doom-modeline-icon nil)
  (doom-modeline-env-version nil)
  (doom-modeline-buffer-file-name-style 'file-name)
  :config
  (doom-modeline-mode t))
