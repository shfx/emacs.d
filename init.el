;; initial setup

(tool-bar-mode 0)
(menu-bar-mode 0)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(set-default 'truncate-lines t)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(global-hl-line-mode 0)
(set-window-margins nil 2 2)
(electric-pair-mode 1)
(show-paren-mode 1)
(scroll-bar-mode 0)

(line-number-mode 0)
(column-number-mode 0)
(global-linum-mode 0)

(setq mac-right-option-modifier nil
      inhibit-startup-message t
      inhibit-splash-screen t
      pop-up-frames nil
      visible-bell 'top-bottom
      ring-bell-function 'ignore
      transient-mark-mode t
      show-paren-mode 1
      mouse-yank-at-point t
      mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-margin 1
      scroll-step 0
      scroll-conservatively most-positive-fixnum
      scroll-preserve-screen-position nil
      make-backup-files nil
      auto-save-default nil)

(defvar my-emacs-dir "~/.emacs.d")

(setq custom-file (concat my-emacs-dir "/custom.el"))
(load custom-file)

;; Seting up package system
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; loading use-package
(eval-when-compile
  (require 'use-package))

(load-theme 'darkokai t)

(when (eq system-type 'darwin)
  (setq ns-use-srgb-colorspace t)
  (defvar ls-lisp-use-insert-directory-program)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

(setq frame-title-format
      '(:eval
        (if buffer-file-name
            (replace-regexp-in-string
             "\\\\" "/"
             (replace-regexp-in-string
              (regexp-quote (getenv "HOME")) "~"
              (convert-standard-filename buffer-file-name)))
          (buffer-name))))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(use-package auto-minor-mode
  :ensure t)

(use-package dimmer
  :ensure t
  :init
  (dimmer-mode))

(use-package wolfram
  :config
  (setq wolfram-alpha-app-id "ATU3W3-E6Y9897JPA"))

(use-package paradox
  :config
  (setq paradox-github-token "4d9de48594f18b99b8d3296ae7d6f39059cb69be"))

(use-package string-inflection
  :ensure t
  :bind
  ("C-c C-u" . string-inflection-all-cycle))

(use-package dash-at-point
  :ensure t
  :bind
  ("C-c d" . dash-at-point)
  ("C-c e" . dash-at-point-with-docset))

(use-package eyebrowse
  :init
  (eyebrowse-mode t))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package fancy-battery
  :config
  (add-hook 'after-init-hook #'fancy-battery-mode))

(use-package anzu
  :init
  (global-anzu-mode +1)
  :bind
  ("M-%" . anzu-query-replace)
  ("C-M-%" . anzu-query-replace-regexp))

(use-package tern
  :ensure t)

(use-package spaceline-config
  :init
  (defvar powerline-default-separator)
  (setq powerline-default-separator 'wave)
  (defadvice vc-mode-line (after strip-backend () activate)
    (when (stringp vc-mode)
      (let ((gitlogo (replace-regexp-in-string "^ Git." "  " vc-mode)))
        (setq vc-mode gitlogo))))

  :config
  (spaceline-compile)
  (spaceline-emacs-theme)
  (spaceline-helm-mode)
  (spaceline-info-mode)
  (setq spaceline-minor-modes-p nil
        spaceline-separator-dir-left '(left . left)
        spaceline-separator-dir-right '(right . right)
        spaceline-workspace-numbers-unicode t
        spaceline-window-numbers-unicode t
        spaceline-highlight-face-func 'spaceline-highlight-face-default))

;; adds colors to matching color names or hex colors
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook 'rainbow-mode))

;; magical git client
(use-package magit
  :ensure t
  :init
  (use-package magit-gitflow
    :config
    (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))
  :config
  (setq magit-process-finish-apply-ansi-colors t)
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package abbrev
  :diminish abbrev-mode
  :config
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file)))

(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode))

(use-package company
  :init
  (global-company-mode)
  :bind
  ("C-." . company-complete)
  :config

  (setq company-idle-delay 0.3
        company-tooltip-limit 15
        company-minimum-prefix-length 1
        company-tooltip-flip-when-above t
        company-backends '()))

(use-package keyfreq
  :ensure t
  :config
  (setq keyfreq-excluded-commands
        '(
          mwheel-scroll
          self-insert-command
          forward-char
          left-char
          right-char
          backward-char
          previous-line
          next-line))

  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

;; (use-package golden-ratio
;;   :ensure t
;;   :init
;;   (golden-ratio-mode 1)
;;   :config
;;   (defun pl/helm-alive-p ()
;;     (if (boundp 'helm-alive-p)
;;         (symbol-value 'helm-alive-p)))
;;   (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
;;   (setq window-combination-resize t)
;;   (when (require 'magit-mode nil 'noerror)
;;     (setq magit-display-buffer-noselect t
;;           magit-display-buffer-function (lambda (buffer)
;;                                           (display-buffer buffer)
;;                                           (pop-to-buffer buffer)))))

(use-package yaml-mode
  :mode "\\.yaml")

(use-package go-mode
  :ensure t
  :mode "\\.go"
  :interpreter "go"
  :config
  (require 'go-mode-autoloads)
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'gofmt-before-save)
              (add-to-list (make-local-variable 'company-backends)
                           '(company-go :width company-yasnippet :separate))
              (local-set-key (kbd "M-.") 'godef-jump))))

(use-package json-mode
  :mode "\\.json$"
  :interpreter "json"
  :config
  (setq js-indent-level 2))

(use-package cask-mode
  :ensure t
  :mode "Cask")

(use-package elm-mode
  :mode "\\.elm"
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-elm-setup)
  (add-hook 'elm-mode-hook
            (lambda ()
              (elm-oracle-setup-completion)
              (add-to-list (make-local-variable 'company-backends)
                           '(company-elm :width company-yasnippet :separate)))))

(use-package scss-mode
  :ensure t
  :mode "\\.scss")

(use-package python-mode
  :mode "\\.py"
  :interpreter "py"
  :config
  (use-package company-jedi)
  (add-hook 'python-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           '(company-jedi :width company-yasnippet :separate)))))

(use-package web-mode
  :ensure t
  :mode ( "\\.html$"
          "\\.js$"
          "\\.php$" )
  :config
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'")))
  (add-hook 'web-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           '(company-flow :width company-yasnippet :separate)))))

(use-package flow-minor-mode
  :ensure t
  :config
  (add-to-list 'auto-minor-mode-alist '("\\.js$" . flow-minor-mode)))

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))

(use-package prettier-js
  :ensure t
  :config
  (add-to-list 'auto-minor-mode-alist '("\\.js$" . prettier-js-mode)))

(use-package indium
  :ensure t)

(use-package multiple-cursors
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this))

(use-package editorconfig
  :init
  (editorconfig-mode 1))

(use-package helm
  :init
  (helm-mode 1)
  :bind
  ("M-x"     . helm-M-x)
  ("M-y"     . helm-show-kill-ring)
  ("C-x b"   . helm-mini)
  ("C-x C-f" . helm-find-files)
  :config
  (defvar helm-M-x-fuzzy-match)
  (defvar flycheck-mode-map)

  (setq helm-display-header-line nil)
  (setq helm-split-window-preferred-function 'ignore)
  (setq helm-M-x-fuzzy-match t)

  (helm-projectile-on)
  (eval-after-load 'flycheck
    '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck)))

(use-package helm-flycheck
  :ensure t
  :after 'helm)

(use-package helm-descbinds
  :init
  (helm-descbinds-mode))

(use-package popwin
  :config
  (popwin-mode 1)
  (push '("^\\*helm.*\\*$"   :height 0.3 :regexp t :position bottom) popwin:special-display-config)
  (push '("*magit-commit*"   :noselect t :height 40 :width 80 :stick t) popwin:special-display-config)
  (push '("*magit-diff*"     :noselect t :height 40 :width 80) popwin:special-display-config)
  (push '("*magit-edit-log*" :noselect t :height 15 :width 80) popwin:special-display-config))

(use-package markdown-mode
  :mode "\\.md")

(use-package projectile
  :init
  (projectile-mode))

(use-package diminish
  :config
  (diminish 'yas-minor-mode)
  (diminish 'rainbow-mode)
  (diminish 'anzu-mode)
  (diminish 'auto-revert-mode)
  (diminish 'flycheck-mode)
  (diminish 'company-mode)
  ;; (diminish 'golden-ratio-mode)
  (diminish 'helm-mode)
  (diminish 'editorconfig-mode))

(use-package flycheck
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq-default flycheck-disabled-checkers
                '(javascript-jscs
                  javascript-jshint
                  handkebars
                  emacs-lisp-checkdoc
                  json-jsonlist)))

(load (concat my-emacs-dir "/keys.el"))

(add-hook 'before-save-hook 'my-delete-trailing-whitespace)

(defun my-delete-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

(setq initial-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)))

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)

(message ".emacs loaded successfully.")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
