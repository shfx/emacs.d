(setopt custom-file
        (if (boundp 'server-socket-dir)
            (expand-file-name "custom.el" server-socket-dir)
          (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))
(setopt auto-revert-avoid-polling t)
(setopt auto-revert-interval 5)
(setopt auto-revert-check-vc-info t)
(setopt sentence-end-double-space nil)
(setopt x-underline-at-descent-line nil)
(setopt switch-to-buffer-obey-display-actions t)
(setopt mouse-wheel-tilt-scroll t)
(setopt mouse-wheel-flip-direction t)
(blink-cursor-mode -1)
(setopt display-line-numbers-width 3)

;; Packages

(package-initialize)

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(if (not package-archive-contents)
    (progn
      (message "Refreshing content")
      (package-refresh-contents))
  (progn
    (message "Refreshing content async")
    (package-refresh-contents t)))

(use-package use-package-ensure-system-package
  :ensure t
  :custom
  (async-shell-command-buffer 'new-buffer))

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
