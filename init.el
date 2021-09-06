(require 'package)

(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
     ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")
     ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Package management
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; All packages should be ensured unless stated othewise
(setq-default use-package-always-ensure t)

;; Garbage Collector Magic Hack
(use-package gcmh
  :config
  (gcmh-mode 1))

;; Install newer version of org-mode
(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib)

;; ;; Track max-specpdl-size exceded error by uncommenting this
;; (setq max-specpdl-size 5)
;; (setq debug-on-error t)

;; Load org literal config config
(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

(setq custom-file
  (if (boundp 'server-socket-dir)
    (expand-file-name "custom.el" server-socket-dir)
    (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

(load custom-file t)
