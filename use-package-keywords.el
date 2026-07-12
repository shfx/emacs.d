(require 'use-package-core)

(setq use-package-keywords
      (use-package-list-insert :electric-ignore use-package-keywords
                               :config t))

(defun use-package-normalize/:electric-ignore (name-symbol keyword args)
  "Normalize raw arguments passed to :electric-ignore."
  ;; Example: Force the user to supply exactly one string argument.
  (use-package-only-one (symbol-name keyword) args
    (lambda (label arg)
      (if (stringp arg)
          arg
        (use-package-error (concat label " expects a single string"))))))

(defun use-package-handler/:electric-ignore (name-symbol keyword args  rest state)
  "Generate the code to disable electric pairs in the package's mode."
  (let ((body (use-package-process-keywords name-symbol rest state))
        ;; We assume the mode name is <package-name>-mode
        (mode-hook (intern (concat (symbol-name name-symbol) "-mode-hook"))))
    (use-package-concat
     body
     `((add-hook ',mode-hook
                 (lambda ()
                   (add-function :before-until (local
                                                'electric-pair-inhibit-predicate)
                                 (lambda (c) (memq c ',args)))))))))
