(let ((gc-cons-threshold most-positive-fixnum))
  (setq-default package-enable-at-startup nil)

  ;; Packages
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (package-initialize)

  ;; Package management
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  ;; All packages should be ensured unless stated othewise
  (setq-default use-package-always-ensure t)

  ;; Garbage Collector Magic Hack
  (use-package gcmh
    :config
    (gcmh-mode 1))

  ;; Install newer version of org-mode
  (use-package org
    :after gcmh
    :mode (("\\.org$" . org-mode))
    :ensure org-plus-contrib)

  ;; Track max-specpdl-size exceded error by uncommenting this
  (setq max-specpdl-size 5)
  (setq debug-on-error t)

  ;; Load org literal config config
  (org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file)

  (garbage-collect))
