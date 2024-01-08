(setq custom-file
      (if (boundp 'server-socket-dir)
          (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

;; Remove signature check before upgrating to new key
(setq package-check-signature nil)

;; Inject PATH from shell
(use-package exec-path-from-shell
  :custom
  (exec-path-from-shell-arguments nil)
  :config
  (when (or (memq window-system '(ns x))
            (daemonp))
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "LSP_USE_PLIST")
    (when (eq (length (getenv "NODE_PATH")) 0)
      (setenv "NODE_PATH" "/usr/local/lib/node_modules"))))

;; Updates public keyring and reverts package-check-signature
(use-package gnu-elpa-keyring-update
  :init
  (setq package-check-signature 'allow-unsigned))

;; Overrides GC, adds big treshold when Emacs is used and then does GC
;; when there is a slight pause in typing
(use-package gcmh
  :custom
  (gcmh-verbose nil)
  (gcmh-idle-delay 2)
  :config
  (restore-post-init-settings)
  (gcmh-mode 1))

;; Install newer version of org-mode
(use-package org
  :pin gnu
  :commands (org-mode org-capture org-agenda)
  :mode (("\\.org$" . org-mode)))

(use-package org-contrib
  :pin nongnu
  :after org)

;; ;; Track max-specpdl-size exceded error by uncommenting this
;; (setq max-specpdl-size 5)
;; (setq debug-on-error t)

;; Load org literal config config
(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

(load custom-file t)
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
