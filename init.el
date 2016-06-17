(tool-bar-mode 0)
(menu-bar-mode 0)

(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(global-hl-line-mode 0)
(set-window-margins nil 2 2)
(electric-pair-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)
(scroll-bar-mode 0)
(line-number-mode 0)
(column-number-mode 0)

(defvar my-emacs-dir "~/.emacs.d")

(setq custom-file (concat my-emacs-dir "/custom.el"))

(set-frame-font "Meslo LG M DZ for Powerline")

(load custom-file)

(load-theme 'monokai t)

(setq inhibit-startup-message t
      inhibit-splash-screen t
      pop-up-frames nil
      visible-bell 'top-bottom
      ring-bell-function 'ignore
      transient-mark-mode t
      show-paren-mode 1
      mouse-yank-at-point t
      mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      make-backup-files nil
      auto-save-default nil)

(eval-when-compile
  (require 'use-package))

(use-package eyebrowse-mode
  :config
  (eyebrowse-mode t))

(use-package anzu
  :init
  (global-anzu-mode +1)
  :config
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

(use-package smooth-scrolling
  :init
  (smooth-scrolling-mode 1))

(use-package spaceline-config
  :config
  (spaceline-spacemacs-theme))

(use-package tern)

(use-package powerline
  :config
  (powerline-default-theme))

(use-package magit
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
  :init (global-company-mode)
  :bind ("C-." . company-complete)
  :config
  (use-package company-tern)
  (use-package company-jedi)
  (setq company-idle-delay 0.1
        company-tooltip-limit 5
        company-minimum-prefix-length 1
        company-tooltip-flip-when-above t
        company-backends '(company-yasnippet)))

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
                           '(company-go :width company-yasnippet :sorted))
              (local-set-key (kbd "M-.") 'godef-jump))))

(use-package json-mode
  :mode "\\.json"
  :interpreter "json"
  :config
  (setq js-indent-level 2))


(use-package js2-mode
  :mode ("\\.js\\'" . js2-jsx-mode)
  :config
  (setq js-indent-level 2)
  (add-hook 'js2-mode-hook
            (lambda ()
              (tern-mode t)
              (add-to-list (make-local-variable 'company-backends)
                           '(company-tern :width company-yasnippet :sorted))
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
  (add-hook 'python-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           '(company-jedi :width company-yasnippet :sorted))
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
  :config
  (setq helm-split-window-preferred-function 'ignore)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-a") 'helm-select-action)
  (helm-projectile-on)
  (eval-after-load 'flycheck
    '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck)))

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

(load (concat my-emacs-dir "/functions.el"))
(load (concat my-emacs-dir "/keys.el"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
