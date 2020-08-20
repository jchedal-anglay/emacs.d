(use-package ivy
  :demand t
  :bind
  ([remap switch-to-buffer] . ivy-switch-buffer)
  (:map ivy-minibuffer-map
        ("RET" . ivy-alt-done)
        ("C-RET" . ivy-done))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (ivy-height 20)
  (ivy-display-style 'fancy)
  (ivy-wrap t)
  (ivy-action-wrap t)
  (ivy-re-builders-alist
   '((t . ivy--regex-plus)))
  :config
  (ivy-mode t))

(use-package counsel
  :after ivy
  :config
  (counsel-mode t)
  (setq ivy-initial-inputs-alist nil))

(use-package swiper
  :if (feature-p! +swiper)
  :after ivy
  :bind
  ("C-s" . swiper))

(use-package ivy-rich
  :after (ivy counsel)
  :custom
  (ivy-rich-parse-remote-buffer nil)
  :config
  (ivy-rich-mode t)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

(use-package ivy-posframe
  :if (feature-p! +posframe)
  :custom
  (ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  :config
  (ivy-posframe-mode))
