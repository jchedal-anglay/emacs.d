;;; core-lib.el --- Core module that defines utility functions and macros -*- lexical-binding: t -*-
;;; Commentary:
;; Defines functions and macros used throughout the configuration
;;; Code:

(defmacro load! (&rest modules)
  "Load the MODULES."
  `(igneous--load-modules ',modules))

(defun igneous--feature-activated-p (category module feature)
  "Return nil if the FEATURE in not activated in the right CATEGORY and MODULE, return its value otherwise."
  (--some (and (-> it car (eq category))
               (-> it cadr (eq module))
               (->> it cddr (memq feature))) igneous--modules))

(defun igneous--hierarchical-cons-to-pairs (predicate list default)
  "Return a list of pairs based on LIST where the left element is the last element which satisfies PREDICATE."
  (cond ((null list) nil)
        ((funcall predicate (car list))
         (igneous--hierarchical-cons-to-pairs predicate (cdr list)
                                     (car list)))
        ((consp (car list))
         (cons `(,default . ,(car list))
               (igneous--hierarchical-cons-to-pairs predicate (cdr list) default)))
        (t (cons `(,default . (,(car list)))
                 (igneous--hierarchical-cons-to-pairs predicate (cdr list) default)))))

(defun igneous--load-modules (modules)
  "Load the MODULES, internals of `load!'."
  (setq igneous--modules (igneous--hierarchical-cons-to-pairs 'keywordp modules :.))
  (mapcar #'igneous--load-pair igneous--modules))

(defun igneous--load-pair (pair)
  "Convert a PAIR (:category . 'module) to a string \"category/module\"."
  (pcase-let ((`(,category . ,module) pair))
    (-> category
        symbol-name
        (substring 1)
        (concat "/" (symbol-name module))
        igneous--load-module)))

(defun igneous--load-module (module-name)
  "Load MODULE-NAME by looking in `igneous-modules-dir'."
  (interactive "FEnter path to module starting from module directory: ")
  (load (expand-file-name module-name igneous-modules-dir)))

(provide 'core-lib)
;;; core-lib.el ends here
