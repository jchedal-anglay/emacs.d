(use-package ivy
  :bind
  ([remap switch-to-buffer] . ivy-switch-buffer)
  (:map ivy-minibuffer-map
        ("<return>" . ivy-alt-done))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (ivy-height 20)
  (ivy-display-style 'fancy)
  (ivy-format-function 'ivy-format-function-line)
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
  (setq-default ivy-initial-inputs-alist nil))

(with-feature! +swiper
  (use-package swiper
    :after ivy
    :bind
    (:map swiper-isearch-map
          ;; Required, bugged by default
          ("M-n" . ivy-next-history-element))))

(use-package ivy-rich
  :after (ivy counsel)
  :custom
  (ivy-rich-parse-remote-buffer nil)
  :config
  (ivy-rich-mode t)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))
