;;; core-lib.el --- Core module that defines utility functions and macros -*- lexical-binding: t -*-
;;; Commentary:
;; Defines functions and macros used throughout the configuration
;;; Code:

(defun load-module (module-name)
  "Load MODULE-NAME by looking in `igneous/modules-dir'."
  (interactive "FEnter path to module starting from module directory: ")
  (load (expand-file-name module-name igneous/modules-dir)))

(defun igneous//load-pair (pair)
  "Convert a PAIR (:category . 'module) to a string \"category/module\"."
  (pcase-let ((`(,category . ,module) pair))
    (-> category
        symbol-name
        (substring 1)
        (concat "/" (symbol-name module))
        load-module)))

(defun igneous//hierarchical-cons-to-pairs (predicate list default)
  "Return a list of pairs based on LIST where the left element is the last element which satisfies PREDICATE."
  (cond
   ((null list) nil)
   ((funcall predicate (car list)) (igneous//hierarchical-cons-to-pairs predicate (cdr list) (car list)))
   (t (cons `(,default . ,(car list)) (igneous//hierarchical-cons-to-pairs predicate (cdr list) default)))))

(defun igneous//load (modules)
  "Load the MODULES, internals of load!."
  (setq igneous--modules modules)
  (mapcar #'igneous//load-pair
          (igneous//hierarchical-cons-to-pairs 'keywordp modules :.)))

(defmacro load! (&rest modules)
  "Load the MODULES."
  `(igneous//load ',modules))

(provide 'core-lib)
;;; core-lib.el ends here
