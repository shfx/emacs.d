(let ((gc-cons-threshold most-positive-fixnum))

  (require 'package)

  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)

  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

  (package-initialize)

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (setq-default
   use-package-always-ensure t)

  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))

  (load custom-file)

  (use-package org
    :defer nil
    :ensure org-plus-contrib)

  (org-babel-load-file (expand-file-name "README.org" user-emacs-directory))
  (garbage-collect))
