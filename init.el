(package-initialize)

(eval-when-compile
  (require 'use-package))

(setq emacsdir "~/.emacs.d"
      exec-path (append '("/usr/local/bin") exec-path)
      custom-file (concat emacsdir "/custom.el"))

(load custom-file)

(set-frame-font "Meslo LG M DZ for Powerline")

(use-package magit)

(use-package
 ido
 :init
 (ido-mode t))

(use-package
 js2-mode
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

(use-package
  flycheck
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode)
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist))))

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
      delete-key-deletes-forward t
      mouse-yank-at-point t
      make-backup-files nil
      auto-save-default nil)

;; Coding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(load (concat emacsdir "/functions.el"))
(load (concat emacsdir "/keys.el"))

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
