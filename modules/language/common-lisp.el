(use-package sly
  :bind
  (:map sly-mrepl-mode-map
        ("C-l" . sly-mrepl-clear-repl)
        ("C-c M-o" . nil)
        ("C-c C-o" . nil))
  :custom
  (inferior-lisp-program "sbcl")
  (sly-kill-without-query-p t)
  (sly-net-coding-system 'utf-8-unix)
  (sly-complete-symbol-function 'sly-simple-completions)
  :config
  (sly-setup)
  ;; Hack to override the :clear-repl-history listener
  (sly-define-channel-method listener :clear-repl-history ()
    (with-current-buffer (sly-channel-get self 'buffer)
      (let ((inhibit-read-only t))
        (erase-buffer)))))

(with-module! :editor company
  (add-hook 'sly-mode-hook #'company-mode))

;; Code taken from https://endlessparentheses.com/eval-result-overlays-in-emacs-lisp.html
;; Adapted for SLY
(with-module! :language clojure
  (autoload 'cider--make-result-overlay "cider-overlays")

  (defun endless/eval-overlay-cl (value point)
    (cider--make-result-overlay (format "%s" value)
      :where point
      :duration 'command)
    value)

  (advice-add 'sly-eval-with-transcript :override
              (lambda (form)
                "Eval FORM in Lisp. Display output, if any."
                (run-hooks 'sly-transcript-start-hook)
                (sly-rex () (form)
                  ((:ok value)
                   (setq igneous--sly-eval-result value)
                   (run-hooks 'sly-transcript-stop-hook)
                   (sly-display-eval-result value))
                  ((:abort condition)
                   (run-hooks 'sly-transcript-stop-hook)
                   (sly-message "Evaluation aborted on %s." condition)))))

  (advice-add 'sly-eval-region :around
              (lambda (f beg end &rest _)
                (prog1
                    (endless/eval-overlay-cl
                     (apply f beg end igneous--sly-eval-result)
                     end)
                  (makunbound 'igneous--sly-eval-result))))

  (advice-add 'sly-eval-last-expression :filter-return
              (lambda (_)
                (prog1
                    (endless/eval-overlay-cl igneous--sly-eval-result (point))
                  (makunbound 'igneous--sly-eval-result))))

  (advice-add 'sly-eval-defun :filter-return
              (lambda (_)
                (prog1
                    (endless/eval-overlay-cl
                     igneous--sly-eval-result
                     (save-excursion
                       (end-of-defun)
                       (point)))
                  (makunbound 'igneous--sly-eval-result)))))

(dependencies! sbcl)
