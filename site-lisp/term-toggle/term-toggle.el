;;; term-toggle.el --- Pop a terminal at the border of a frame  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Julien Chedal-Anglay

;; Author: Julien Chedal-Anglay <chedala.julien@gmail.com>
;; Keywords: terminals, frames

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Create terminal pop-ups at a given position.

;;; Code:
;; Requires
(require 'popwin)

(defvar term-toggle-pos :bottom "Default position for a pop.")
(defvar term-toggle-function 'ansi-term "Default function to run.")
(defvar term-toggle-args '("zsh") "Default argument list.")
(defvar term-toggle-name "*term*" "Default name for a pop.")
(defvar term-toggle-size 15 "Default size for a pop.")

(defun term-toggle--pop (name)
  "Pop a newly created terminal at POS or `term-toggle-pos`, make its buffer name NAME."
  (popwin:display-buffer-1
   (or (get-buffer name)
       (save-window-excursion
         (apply term-toggle-function term-toggle-args)))
   :default-config-keywords `(:width ,term-toggle-size :height ,term-toggle-size :position ,term-toggle-pos :noselect nil :stick t))
  (rename-buffer name))

(defun term-toggle (&optional name)
    "Create or destroy a popped up terminal NAME based on whether or not it exists."
    (interactive)
    (let ((name (or name term-toggle-name)))
      (cond
       ((get-buffer-window name) (kill-buffer name))
       ((get-buffer name) (progn (kill-buffer name) (term-toggle)))
       (t (term-toggle--pop name)))))

(provide 'term-toggle)
;;; term-toggle.el ends here
