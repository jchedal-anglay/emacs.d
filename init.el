;; Required so it isn't automatically added by package.el
;; (package-initialize)
(let ((file-name-handler-alist nil))
  (org-babel-load-file (concat user-emacs-directory "config.org")))
