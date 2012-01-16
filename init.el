;; Startup messages

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; Coding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; bell
(setq visible-bell 'top-bottom)
(setq ring-bell-function 'ignore)

;(setq ring-bell-function
;      (lambda ()
;        (unless (memq this-command
;                      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
;          (ding))))

;; Paths
(setq emacsdir "~/.emacs.d")                    ; main config dir
(setq elpa-dir (concat emacsdir "/elpa"))       ; elpa packages dir
(setq plugins-dir (concat emacsdir "/plugins")) ; not-elpa'd plugins
(setq theme-dir (concat emacsdir "/themes"))

;; custom file
(setq custom-file (concat emacsdir "/custom.el"))
(load custom-file)

(load (concat emacsdir "/functions.el"))
(load (concat emacsdir "/keys.el"))

(add-to-list 'load-path plugins-dir)            ; set up plugins path

(setq features
      '((ido       . t)
        (tramp     . t)
        (php-mode  . t)
        (js3-mode  . t)
        (font-lock . t)
        (elip      . t)
        (theming   . window-system)
        (toolbar   . window-system)))

(feature ido
         (require 'ido)
         (ido-mode t)
         (setq ido-create-new-buffer 'always)
         (setq ido-enable-flex-matching t))

(feature tramp
         (require 'tramp))

(feature php-mode
         (require 'php-mode)
         (add-to-list 'auto-mode-alist '("\\.php\\'\\|\\.phtml\\'" . php-mode)))

(feature js3-mode
	 (autoload 'js3-mode "js3" nil t)
         ;(require 'js3)
         (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode)))
 
(feature font-lock
         (require 'font-lock)
         (global-font-lock-mode t))

(feature elip
         (when
             (load (expand-file-name (concat elpa-dir "/package.el")))
           (package-initialize)))

(feature theming
         (add-to-list 'custom-theme-load-path theme-dir)
         (load-theme 'tango-dark))

(feature toolbar
         (tool-bar-mode -1))

(line-number-mode t)
(column-number-mode t)
                                        ; podswietlanie zaznaczenia
(setq transient-mark-mode t
      ;delete-selection-mode t
      show-paren-mode 1
      delete-key-deletes-forward t
      mouse-yank-at-point t)

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)

(fset 'yes-or-no-p 'y-or-n-p) ; zamienia prompty yes/no na y/n

(message ".emacs loaded successfully.")
