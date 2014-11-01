(require 'dash)
(require 's)

;; require ido
(require 'ido)
(ido-mode t)

;; require magit
(require 'magit)

;; Startup messages

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; Coding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; bell
(setq visible-bell 'top-bottom
      ring-bell-function 'ignore
      ;; Paths
      emacsdir "~/.emacs.d")

;; custom file
(setq custom-file (concat emacsdir "/custom.el"))
(load custom-file)

(load (concat emacsdir "/functions.el"))
(load (concat emacsdir "/keys.el"))

(tool-bar-mode 0)
(menu-bar-mode 0)

(setq initial-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)))

(global-hl-line-mode 0)
(setq pop-up-frames nil)
(set-window-margins nil 0 0)
(electric-pair-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)
(scroll-bar-mode 0)
(line-number-mode t)
(column-number-mode t)
                                        ; podswietlanie zaznaczenia
(setq transient-mark-mode t
      show-paren-mode 1
      delete-key-deletes-forward t
      mouse-yank-at-point t
      make-backup-files nil
      auto-save-default nil)

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (push '("<=" . ?≤) prettify-symbols-alist)))

(-each
   (-map
      (lambda (item)
      (format "~/.emacs.d/elpa/%s" item))
   (-filter
      (lambda (item) (s-contains? "theme" item))
      (directory-files "~/.emacs.d/elpa/")))
   (lambda (item)
      (add-to-list 'custom-theme-load-path item)))

(message ".emacs loaded successfully.")
