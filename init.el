(package-initialize)

(defvar my-emacs-dir "~/.emacs.d")

(eval-when-compile
  (require 'use-package))

(setq exec-path (append '("/usr/local/bin") exec-path)
      custom-file (concat my-emacs-dir "/custom.el"))

(load custom-file)

(set-frame-font "Meslo LG M DZ for Powerline")

(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package js2-mode
 :mode "\\.js"
 :interpreter "js"
 :config
 (setq js-indent-level 2))

(use-package
  web-mode
  :mode "\\.html"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package helm
  :init
  (progn
    (helm-mode 1)))

(use-package git-gutter
  :config
  (global-git-gutter-mode +1))

(use-package markdown-mode
  :mode "\\.md")

(use-package projectile
  :init
  (projectile-global-mode)
  :config
  (setq projectile-switch-project-action 'neotree-projectile-action))

(use-package neotree
  :init
  (progn
    (setq-default neo-smart-open t)
    (setq-default neo-dont-be-alone t))
  :config
  (global-set-key [f8] 'neotree-toggle))

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

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq inhibit-startup-message t 
      inhibit-splash-screen t
      pop-up-frames nil
      ;; bell
      visible-bell 'top-bottom
      ring-bell-function 'ignore
      transient-mark-mode t
      show-paren-mode 1
      mouse-yank-at-point t
      make-backup-files nil
      auto-save-default nil)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(load (concat my-emacs-dir "/functions.el"))
(load (concat my-emacs-dir "/keys.el"))

(tool-bar-mode 0)
(menu-bar-mode 0)

(setq initial-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)))

(global-hl-line-mode 0)
(set-window-margins nil 2 2)
(electric-pair-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)
(scroll-bar-mode 0)
(line-number-mode t)
(column-number-mode t)

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (push '("<=" . ?≤) prettify-symbols-alist)))

(load-theme 'monokai t)

(message ".emacs loaded successfully.")
