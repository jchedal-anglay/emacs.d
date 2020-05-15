;;; core-bindings.el --- Core module that redefines keybindings -*- lexical-binding: t -*-
;;; Commentary:
;; Modifies keybindings of builtin modes and functions.
;;; Code:

(global-set-key (kbd "C-x C-b") #'ibuffer)
(define-key 'dired-mode-map (kbd "C-c C-c") #'wdired-change-to-wdired-mode)
(define-key 'comint-mode-map (kbd "C-l") #'comint-clear-buffer)

(use-package mwim
  :bind
  ("C-a" . mwim-beginning)
  ("C-e" . mwim-end))

(provide 'core-bindings)
;;; core-bindings.el ends here
