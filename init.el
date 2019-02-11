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

(setq
 ;; mac-right-option-modifier nil
 inhibit-startup-message t
 inhibit-splash-screen t
 pop-up-frames nil
 visible-bell 'top-bottom
 ring-bell-function 'ignore
 transient-mark-mode t
 show-paren-mode 1
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
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))


(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package darkokai-theme
  :ensure t
  :init
  :config (load-theme 'darkokai t))

;; theme
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;;;; Disabled for a moment

;; (defun on-after-init ()
;;   (unless (display-graphic-p (selected-frame))
;;     (set-face-background 'default "unspecified-bg" (selected-frame))))
;; (add-hook 'window-setup-hook 'on-after-init)

;; defaults for ls
(when (eq system-type 'darwin)
  (defvar ls-lisp-use-insert-directory-program)
  (defvar powerline-image-apple-rgb)
  (setq ns-use-srgb-colorspace t)
  (setq powerline-image-apple-rgb t)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

;; title format
(setq frame-title-format
      '(:eval
        (if buffer-file-name
            (replace-regexp-in-string
             "\\\\" "/"
             (replace-regexp-in-string
              (regexp-quote (getenv "HOME")) "~"
              (replace-regexp-in-string
               (projectile-project-root) (concat (projectile-project-name) "/")
               (convert-standard-filename buffer-file-name))))
          (buffer-name))))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(use-package better-defaults
  :ensure t)

(use-package auto-minor-mode
  :ensure t)

;; (use-package dimmer
;;   :ensure t
;;   :init
;;   (dimmer-mode))

(use-package nlinum-hl
  :ensure t
  :config (setq nlinum-highlight-current-line t))

(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (setq which-key-popup-type 'side-window
        which-key-side-window-location 'right
        which-key-side-window-max-width 0.33
        which-key-side-window-max-height 0.25))

(use-package zoom
  :ensure t
  :init
  (zoom-mode)
  :config
  (setq zoom-size '(0.618 . 0.618)
        zoom-ignored-major-modes '(ranger-mode)
        zoom-ignored-buffer-name-regexps '("^\\*helm" "^\\*which-key*")))

(use-package atomic-chrome
  :ensure t)

(use-package helpful
  :ensure t
  :bind (("C-h f"  . helpful-callable)
         ("C-h v"  . helpful-variable)
         ("C-h k"  . helpful-key)))

(use-package nlinum-hl
  :ensure t
  :config (setq nlinum-highlight-current-line t))

(use-package wolfram
  :ensure t
  :config
  (setq wolfram-alpha-app-id "ATU3W3-E6Y9897JPA"))

(use-package paradox
  :ensure t
  :config
  (paradox-enable))

(use-package copy-as-format
  :ensure t
  :bind (("C-c w g" . copy-as-format-gitlab)
         ("C-c w s" . copy-as-format-slack)))

(use-package string-inflection
  :ensure t
  :bind
  ("C-c C-u" . string-inflection-all-cycle))

(use-package dash-at-point
  :ensure t
  :bind
  ("C-c d" . dash-at-point)
  ("C-c e" . dash-at-point-with-docset))

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

(use-package fancy-battery
  :ensure t
  :config
  (add-hook 'after-init-hook 'fancy-battery-mode))

(use-package anzu
  :ensure t
  :init
  (global-anzu-mode +1)
  :bind
  ("M-%" . anzu-query-replace)
  ("C-M-%" . anzu-query-replace-regexp))

(use-package all-the-icons
  :ensure t)

(use-package spaceline
  :ensure t
  :init
  (spaceline-emacs-theme)
  ;; (defvar powerline-default-separator)
  (setq powerline-default-separator 'wave)
  ;; (defadvice vc-mode-line (after strip-backend () activate)
  ;;   (when (stringp vc-mode)
  ;;     (let ((gitlogo (replace-regexp-in-string "^ git." "  " vc-mode)))
  ;;       (setq vc-mode gitlogo))))

  :config
  (spaceline-compile)
  (spaceline-helm-mode)
  (spaceline-info-mode)
  (setq spaceline-minor-modes-p nil
        spaceline-separator-dir-left '(left . left)
        spaceline-separator-dir-right '(right . right)
        spaceline-workspace-numbers-unicode t
        spaceline-window-numbers-unicode t
        spaceline-highlight-face-func 'spaceline-highlight-face-default))

;; (use-package spaceline-all-the-icons
;;   :ensure t
;;   :after spaceline
;;   :config
;;   (spaceline-all-the-icons-theme)
;;   (spaceline-all-the-icons--setup-neotree)
;;   (spaceline-all-the-icons--setup-package-updates))

;; magical git client
(use-package magit
  :ensure t
  :init
  (use-package magit-gitflow
    :ensure t
    :hook (magit-mode . turn-on-magit-gitflow))
  :config
  (setq magit-process-finish-apply-ansi-colors t)
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package abbrev
  :diminish abbrev-mode
  :config
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file)))

(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  :hook (prog-mode . yas-minor-mode))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :bind
  ("C-." . company-complete)
  ("C-c /" . 'company-files)
  :config
  (setq company-idle-delay 0.3
        company-tooltip-limit 15
        company-minimum-prefix-length 1
        company-tooltip-flip-when-above t
        company-tooltip-align-annotations t
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

(use-package yaml-mode
  :ensure t
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
  :ensure t
  :mode "\\.json$"
  :interpreter "json"
  :config
  (setq js-indent-level 2))

(use-package cask-mode
  :ensure t
  :mode "Cask")

(use-package scss-mode
  :ensure t
  :mode "\\.scss")

(use-package python-mode
  :ensure t
  :mode "\\.py"
  :interpreter "py"
  :config
  (use-package company-jedi)
  (add-hook 'python-mode-hook
            (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           '(company-jedi :width company-yasnippet :separate)))))

;; (use-package flow-minor-mode
;;   :ensure t
;;   :minor ("\\.js$" . flow-minor-mode))

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))

(use-package prettier-js
  :ensure t
  :minor ("\\.js" . prettier-js-mode))

(use-package indium
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this))

(use-package editorconfig
  :ensure t
  :init
  (editorconfig-mode 1))

(use-package projectile
  :ensure t
  :init
  (projectile-mode))

(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  :bind
  ("M-x"     . helm-M-x)
  ("M-y"     . helm-show-kill-ring)
  ("C-x b"   . helm-mini)
  ("C-x C-f" . helm-find-files)
  ("C-c p" .  projectile-command-map)

  :config
  (defvar helm-M-x-fuzzy-match)
  (defvar flycheck-mode-map)

  (setq helm-display-header-line nil
        helm-split-window-preferred-function 'ignore
        helm-M-x-fuzzy-match t)

  (eval-after-load 'flycheck
    '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck)))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package helm-flycheck
  :ensure t
  :after 'helm)

(use-package helm-descbinds
  :ensure t
  :init
  (helm-descbinds-mode))

(use-package popwin
  :ensure t
  :config
  (popwin-mode 1)
  (push '("^\\*helm.*\\*$"   :height 0.3 :regexp t :position bottom) popwin:special-display-config)
  (push '("*magit-commit*"   :noselect t :height 40 :width 80 :stick t) popwin:special-display-config)
  (push '("*magit-diff*"     :noselect t :height 40 :width 80) popwin:special-display-config)
  (push '("*magit-edit-log*" :noselect t :height 15 :width 80) popwin:special-display-config))

(use-package markdown-mode
  :ensure t
  :mode "\\.md")

;; TODO: move diminish to use-package config
(use-package diminish
  :ensure t
  :config
  (diminish 'yas-minor-mode)
  (diminish 'anzu-mode)
  (diminish 'auto-revert-mode)
  (diminish 'flycheck-mode)
  (diminish 'company-mode)
  ;; (diminish 'golden-ratio-mode)
  (diminish 'helm-mode)
  (diminish 'editorconfig-mode))

(use-package flycheck-flow
  :ensure t)

(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-flow 'web-mode)
  (setq-default flycheck-disabled-checkers
                '(javascript-jscs
                  javascript-jshint
                  handkebars
                  emacs-lisp-checkdoc
                  json-jsonlist)))

;; Enable flow-mode for .js files
(defun setup-flow-mode ()
  (interactive)
  (message "Setting flow mode...")
  (add-to-list (make-local-variable 'company-backends)
               '(company-flow :width company-yasnippet :separate)))

;; Enable tide-mode for .ts and .tsx files
(defun setup-tide-mode ()
  (interactive)
  (message "Setting tide mode...")
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (if (string-equal "tsx" (file-name-extension buffer-file-name))
      (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
    (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)))

(use-package tide
  :ensure t
  :mode "\\.ts$"
  :after (flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package web-mode
  :ensure t
  :after (tide)
  :mode ("\\.html$"
         "\\.js$"
         "\\.php$"
         "\\.tsx$")
  :hook (( web-mode . (lambda ()
                        (when (string-equal "js" (file-name-extension buffer-file-name))
                          (setup-flow-mode))))

         (web-mode . (lambda ()
                       (when (string-equal "tsx" (file-name-extension buffer-file-name))
                           (setup-tide-mode)))))
  :config
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(load (concat my-emacs-dir "/keys.el"))

(add-hook 'before-save-hook 'my-delete-trailing-whitespace)

(defun my-delete-trailing-whitespace ()
  "Deleting trailing whitespaces."
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
