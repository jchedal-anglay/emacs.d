;;; core-straight.el --- Core module that initializes the package manager, using straight -*- lexical-binding: t -*-
;;; Commentary:
;; Initializes the package manager through straight
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defalias 'use-package 'straight-use-package)

(provide 'core-straight)
;;; core-straight.el ends here
