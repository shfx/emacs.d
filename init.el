(tool-bar-mode 0)
(menu-bar-mode 0)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(when (eq system-type 'darwin)
  (setq ns-use-srgb-colorspace nil)
  (defvar ls-lisp-use-insert-directory-program)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

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

;; (add-hook 'prog-mode-hook 'linum-mode)

(defvar my-emacs-dir "~/.emacs.d")

(setq custom-file (concat my-emacs-dir "/custom.el"))

(load custom-file)

(defvar darkokai-mode-line-padding 1)
(load-theme 'darkokai t)

(set-frame-font "Fira Code")

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

(defun toggle-maximize-buffer ()
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

(global-set-key (kbd "<C-return>") 'toggle-maximize-buffer)

(eval-when-compile
  (require 'use-package))

(use-package dash-at-point
  :ensure t
  :bind
  ("C-c d" . dash-at-point)
  ("C-c e" . dash-at-point-with-docset))

(use-package eyebrowse
  :init
  (eyebrowse-mode t))

;; (use-package context-coloring
;;   :ensure t
;;   :config
;;   (tern-context-coloring-setup))

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
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (setq spaceline-minor-modes-p nil
        spaceline-separator-dir-left '(left . left)
        spaceline-separator-dir-right '(right . right)
        spaceline-highlight-face-func 'spaceline-highlight-face-default))



(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package magit
  :ensure t
  :config
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
  (use-package company-flx
    :init
    (company-flx-mode +1))

  (setq company-idle-delay 0.1
        company-tooltip-limit 10
        company-minimum-prefix-length 2
        company-tooltip-flip-when-above t
        company-backends '()))

(use-package keyfreq
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

(use-package golden-ratio
  :init
  (golden-ratio-mode 1)
  :config
  (defun pl/helm-alive-p ()
    (if (boundp 'helm-alive-p)
        (symbol-value 'helm-alive-p)))
  (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
  (setq window-combination-resize t)
  (when (require 'magit-mode nil 'noerror)
    (setq magit-display-buffer-noselect t
          magit-display-buffer-function (lambda (buffer)
                                          (display-buffer buffer)
                                          (pop-to-buffer buffer)))))

(use-package yaml-mode
  :mode "\\.yaml")

(use-package go-mode
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
  :mode "\\.json"
  :interpreter "json"
  :config
  (setq js-indent-level 2))


(use-package js2-mode
  :mode ("\\.js" . js2-jsx-mode)
  :init
  (use-package company-tern)
  :config
  (setq js-indent-level 2)
  (add-hook 'js2-mode-hook
            (lambda ()
              (tern-mode t)
              (add-to-list (make-local-variable 'company-backends)
                           '(company-tern :width company-yasnippet :separate))
              )))

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
                           '(company-elm :width company-yasnippet :separate))
              )))

(use-package scss-mode
  :ensure t
  :mode "\\.scss"
  :config
  (add-hook 'scss-mode-hook 'flycheck-mode))

(use-package python-mode
  :mode "\\.py"
  :interpreter "py"
  :config
  (use-package company-jedi)
  (add-hook 'python-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           '(company-jedi :width company-yasnippet :separate))
              )))

(use-package web-mode
  :mode "\\.html"
  :interpreter "html"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

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
  (projectile-global-mode))

(use-package diminish
  :config
  (diminish 'yas-minor-mode)
  (diminish 'rainbow-mode)
  (diminish 'anzu-mode)
  (diminish 'auto-revert-mode)
  (diminish 'flycheck-mode)
  (diminish 'company-mode)
  (diminish 'golden-ratio-mode)
  (diminish 'helm-mode))

(use-package flycheck
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config

  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint
                          emacs-lisp-checkdoc
                          json-jsonlist))))

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
