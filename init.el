(setq custom-file
      (if (boundp 'server-socket-dir)
          (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

;; Packages

(eval-when-compile
  (require 'use-package))

(use-package use-package-ensure-system-package
  :ensure t
  :custom
  (async-shell-command-buffer 'new-buffer))

(setq use-package-always-ensure t)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

;; initialize after package-archives and package-user-dir are redefined
(package-initialize)

(package-read-all-archive-contents)

(if (not package-archive-contents)
    (progn
      (message "Refreshing content")
      (package-refresh-contents))
  (progn
    (message "Refreshing content async")
    (package-refresh-contents t)))

(use-package no-littering)

(use-package auto-compile
  :custom
  (auto-compile-display-buffer nil)
  (auto-compile-mode-line-counter t)
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(fset #'x-apply-session-resources #'ignore)

;; Remove signature check before upgrating to new key
(setq package-check-signature nil)

;; Updates public keyring and reverts package-check-signature
(use-package gnu-elpa-keyring-update
  :init
  (setq package-check-signature 'allow-unsigned))

;; Inject PATH from shell
(use-package exec-path-from-shell
  :custom
  (exec-path-from-shell-variables '("PATH" "MANPATH" "LSP_USE_PLISTS" "GOPATH"))
  :config
  (when (or (memq window-system '(ns x))
            (daemonp))
    (exec-path-from-shell-initialize)))

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
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
