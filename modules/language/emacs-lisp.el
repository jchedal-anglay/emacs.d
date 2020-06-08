(with-module! :editor company
  (add-hook 'emacs-lisp-mode-hook #'company-mode))


;; Code taken from https://endlessparentheses.com/eval-result-overlays-in-emacs-lisp.html
(with-module! :language clojure
  (autoload 'cider--make-result-overlay "cider-overlays")

  (defun endless/eval-overlay (value point)
    (cider--make-result-overlay (format "%S" value)
                                :where point
                                :duration 'command)
    value)

  (advice-add 'eval-region :around
              (lambda (f beg end &rest r)
                (endless/eval-overlay
                 (apply f beg end r)
                 end)))

  (advice-add 'eval-last-sexp :filter-return
              (lambda (r)
                (endless/eval-overlay r (point))))

  (advice-add 'eval-defun :filter-return
              (lambda (r)
                (endless/eval-overlay
                 r
                 (save-excursion
                   (end-of-defun)
                   (point))))))
