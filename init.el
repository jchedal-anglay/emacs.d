;; -*- lexical-binding: t -*-

(defconst igneous/required-version "25.1")
(when (version< emacs-version igneous/required-version)
  (error "Requires GNU Emacs %s or newer, but current version is %s" igneous/required-version emacs-version))

(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 32 1000000)
                                            gc-cons-percentage 0.1)))

(defvar igneous/dir user-emacs-directory)
(defvar igneous/core-dir (expand-file-name "core" igneous/dir))
(defvar igneous/modules-dir (expand-file-name  "modules" igneous/dir))

(setq load-prefer-newer t)
