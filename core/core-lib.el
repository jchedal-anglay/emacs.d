;;; core-lib.el --- Core module that defines utility functions and macros -*- lexical-binding: t -*-
;;; Commentary:
;; Defines functions and macros used throughout the configuration
;;; Code:

(defmacro load! (&rest modules)
  "Load the MODULES."
  `(load-module ',modules))

(defun hierarchical-cons-to-pairs (predicate list default)
  "Return a list of pairs based on LIST where the left element is the last element which satisfies PREDICATE."
  (cond
   ((null list)
    nil)
   ((funcall predicate (car list))
    (hierarchical-cons-to-pairs predicate (cdr list) (car list)))
   (t
    (cons `(,default . ,(car list))
          (hierarchical-cons-to-pairs predicate (cdr list) default)))))

(defun load-modules (modules)
  "Load the MODULES, internals of `load!'."
  (setq igneous--modules (hierarchical-cons-to-pairs 'keywordp modules :.))
  (mapcar #'load-pair igneous--modules))

(defun load-pair (pair)
  "Convert a PAIR (:category . 'module) to a string \"category/module\"."
  (pcase-let ((`(,category . ,module) pair))
    (-> category
        symbol-name
        (substring 1)
        (concat "/" (symbol-name module))
        load-module)))

(defun load-module (module-name)
  "Load MODULE-NAME by looking in `igneous/modules-dir'."
  (interactive "FEnter path to module starting from module directory: ")
  (load (expand-file-name module-name igneous/modules-dir)))

(provide 'core-lib)
;;; core-lib.el ends here
