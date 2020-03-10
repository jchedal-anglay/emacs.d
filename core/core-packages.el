;;; core-packages.el --- Core module that initializes the package manager -*- lexical-binding: t -*-
;;; Commentary:
;; Initializes the package manager through use-package
;;; Code:

(require 'package)

;; Hotfix, required in emacs 26.1 due to bug #34341
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(when (= emacs-major-version 26)
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(when (file-directory-p (concat igneous-dir "elpa-mirror"))
  (setq package-archives `(("melpa" . ,(concat igneous-dir "elpa-mirror/melpa"))
                           ("gnu" . ,(concat igneous-dir "elpa-mirror/gnu"))
                           ("org" . ,(concat igneous-dir "elpa-mirror/org")))))

(when (< emacs-major-version 27)
  (package-initialize))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
(setq use-package-compute-statistics t)
(setq use-package-verbose t)

(provide 'core-packages)
;;; core-packages.el ends here
