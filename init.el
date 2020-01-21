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

  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file)

  ;; Install newer version of org-mode
  (use-package org
    :mode (("\\.org$" . org-mode))
    :ensure org-plus-contrib)

  ;; Load org literal config config
  (org-babel-load-file (expand-file-name "README.org" user-emacs-directory))
  (garbage-collect))
