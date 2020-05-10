(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (unless (find-font (font-spec :name "all-the-icons"))
    (all-the-icons-install-fonts t)))

(with-eval-after-load 'dashboard
  (setq dashboard-set-file-icons t
        dashboard-set-heading-icons t))
