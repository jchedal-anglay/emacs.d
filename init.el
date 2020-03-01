(defconst igneous/required-version "25.1")
(when (version< emacs-version igneous/required-version)
  (error "Requires GNU Emacs %s or newer, but current version is %s" igneous/required-version emacs-version))
