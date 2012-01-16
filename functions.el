(defmacro feature (feature &rest args)
  `(when (cdr (assoc (quote ,feature) features))
     ,@args))

(defun goto-file ()
  "goto file."
  (interactive)
  (let (myword)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myword (concat "~/html/data/all/" myword ".php"))
    (find-file myword)))
