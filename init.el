(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar my-emacs-dir "~/.emacs.d")

(setq custom-file (concat my-emacs-dir "/custom.el"))

(load custom-file)

(use-package org
  :ensure org-plus-contrib
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :config
  (setq
   org-startup-indented t
   org-indent-indentation-per-level 1
   org-default-notes-file (concat org-directory "/notes.org")))

(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-molokai))


(use-package auto-minor-mode
  :defer nil
  :ensure t)

(org-babel-load-file "~/.emacs.d/config.org")
