(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(set-default 'truncate-lines t)
(global-hl-line-mode 0)
(set-window-margins nil 0 0)
(electric-pair-mode 1)
(line-number-mode 0)
(column-number-mode 0)
(global-linum-mode 0)
(desktop-save-mode 1)
(savehist-mode 1)
(setq inhibit-splash-screen t
      inhibit-startup-message t
      pop-up-frames nil
      visible-bell 'top-bottom
      ring-bell-function 'ignore
      transient-mark-mode t
      show-paren-mode 1
      make-backup-files nil
      auto-save-default nil
      vc-handled-backends nil
      ns-use-proxy-icon nil
      frame-title-format "Emacs"
      auto-save-visited-file-name t
      linum-format " %2d"
      ns-right-alternate-modifier nil)

(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "s-w"))
(windmove-default-keybindings 'super)

;; font sizes
(global-set-key (kbd "s-=")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (+ old-face-attribute 10)))))

(global-set-key (kbd "s--")
                (lambda ()
                  (interactive)
                  (let ((old-face-attribute (face-attribute 'default :height)))
                    (set-face-attribute 'default nil :height (- old-face-attribute 10)))))

(use-package osx-trash
  :ensure t
  :if (eq system-type 'darwin)
  :config
  (setq delete-by-moving-to-trash t))

(setq frame-title-format
  '("Emacs - " (buffer-file-name "%f"
  '(dired-directory dired-directory "%b"))))

(when (eq system-type 'darwin)
  (defvar ls-lisp-use-insert-directory-program)
  (defvar powerline-image-apple-rgb)
  (setq ns-use-srgb-colorspace t)
  (setq powerline-image-apple-rgb t)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))

(use-package eshell
  :ensure t
  :hook
  (eshell-mode . (lambda ()
                   (eshell-cmpl-initialize)
                   (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
                   (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)
                   (define-key eshell-mode-map (kbd "M-s f") 'helm-eshell-prompts-all)))
  :config
  (setq
   helm-show-completion-display-function #'helm-show-completion-default-display-function
   eshell-prompt-function (lambda ()
                            (concat (getenv "USER") "@"
                                    (if (= (user-uid) 0) " # " " $ ")))))

(use-package esh-autosuggest
  :ensure t
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package expand-region
  :bind ("C-=" . er/expand-region)
  :ensure t)

(use-package auto-minor-mode
  :ensure t)

(use-package eyebrowse
  :ensure t
  :init
  (eyebrowse-mode t))

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
  ("C-c p"   . projectile-command-map)

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
  :after (helm)
  :bind
  ("<f5>" . helm-projectile)

  :config
  (helm-projectile-on))

(use-package helm-flycheck
  :ensure t
  :after (helm))

(use-package helm-descbinds
  :ensure t
  :after (helm)
  :init
  (helm-descbinds-mode))

(use-package indium
  :ensure t)

(use-package multiple-cursors
  :ensure t
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-molokai t))

(use-package better-defaults
  :ensure t)

(use-package nlinum-hl
  :ensure t
  :config (setq nlinum-highlight-current-line t))

(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (setq which-key-popup-type 'side-window
        which-key-side-window-location 'bottom
        which-key-side-window-max-width 0.33
        which-key-side-window-max-height 0.25))

(use-package atomic-chrome
  :ensure t)

(use-package helpful
  :ensure t
  :bind (("C-h f"  . helpful-callable)
         ("C-h v"  . helpful-variable)
         ("C-h k"  . helpful-key)))

(use-package paradox
  :ensure t
  :config
  (paradox-enable))

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

(use-package anzu
  :ensure t
  :init
  (global-anzu-mode +1)
  :bind
  ("M-%" . anzu-query-replace)
  ("C-M-%" . anzu-query-replace-regexp))

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

(use-package magit
  :ensure t
  :init
  :config
  (setq magit-process-finish-apply-ansi-colors t
        magit-refresh-status-buffer nil)
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

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package flyspell-popup
  :ensure t
  :bind ("C-;" . flyspell-popup-correct))

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

(use-package prettier-js
  :ensure t)

(use-package symbol-overlay
  :ensure t
  :bind
  ("M-i" . symbol-overlay-put)
  ("M-n" . symbol-overlay-switch-forward)
  ("M-p" . symbol-overlay-switch-backward)
  ("<f7>" . symbol-overlay-mode)
  ("<f8>" . symbol-overlay-remove-all))

(use-package dired
  :config
  (setq insert-directory-program "/usr/local/opt/coreutils/libexec/gnubin/gls")
  (setq dired-listing-switches "-alXv"))

(use-package diredfl
  :ensure t
  :init
  (diredfl-global-mode 1))

(use-package tern
  :ensure company-tern
  :diminish tern-mode
  :config
  (setq tern-command (append tern-command '("--no-port-file")))
  :init
    (add-hook 'rjsx-mode-hook 'tern-mode))

(use-package reason-mode
  :ensure t
  :config
  (defun shell-cmd (cmd)
    "Returns the stdout output of a shell command or nil if the command returned
   an error"
    (car (ignore-errors (apply 'process-lines (split-string cmd)))))

  (defun reason-cmd-where (cmd)
    (let ((where (shell-cmd cmd)))
      (if (not (string-equal "unknown flag ----where" where))
          where)))

  (let* ((refmt-bin (or (reason-cmd-where "refmt ----where")
                        (shell-cmd "which refmt")
                        (shell-cmd "which bsrefmt")))
         (merlin-bin (or (reason-cmd-where "ocamlmerlin ----where")
                         (shell-cmd "which ocamlmerlin")))
         (merlin-base-dir (when merlin-bin
                            (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
    ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
    (when merlin-bin
      (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
      (setq merlin-command merlin-bin))

    (when refmt-bin
      (setq refmt-command refmt-bin)))

  (add-hook 'reason-mode-hook (lambda ()
                                (add-hook 'before-save-hook 'refmt-before-save)
                                (merlin-mode)))

  (setq merlin-ac-setup t))

(use-package org
  :ensure org-plus-contrib
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :config
  (setq org-startup-indented t
        org-indent-indentation-per-level 1
        org-default-notes-file (concat org-directory "/notes.org")

        org-agenda-files (list "~/Dropbox/orgfiles/gcal.org"
                               "~/Dropbox/orgfiles/i.org")

        org-capture-templates '(("a" "Appointment" entry (file  "~/Dropbox/Orgfiles/gcal.org" )
                                 "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
                                ("l" "Link" entry (file+headline "~/Dropbox/Orgfiles/links.org" "Links")
                                 "* %? %^L %^g \n%T" :prepend t)
                                ("b" "Blog idea" entry (file+headline "~/Dropbox/Orgfiles/todo.org" "Blog Topics:")
                                 "* %?\n%T" :prepend t)
                                ("t" "To Do Item" entry (file+headline "~/Dropbox/Orgfiles/todo.org" "To Do")
                                 "* TODO %?\n%u" :prepend t)
                                ("n" "Note" entry (file+headline "~/Dropbox/Orgfiles/todo.org" "Note space")
                                 "* %?\n%u" :prepend t)
                                ("j" "Journal" entry (file+datetree "~/Dropbox/Orgfiles/journal.org")
                                 "* %?\nEntered on %U\n  %i\n  %a")
                                ("s" "Screencast" entry (file "~/Dropbox/Orgfiles/screencastnotes.org")
                                 "* %?\n%i\n"))))

(use-package org-bullets
  :hook (org-mode . (lambda () (org-bullets-mode 1)))
  :ensure t)

(use-package org-gcal
  :ensure t
  :config
  (setq org-gcal-client-id "oauth 2.0 client ID"
        org-gcal-client-secret "client secret"
        org-gcal-file-alist '(("zamansky@gmail.com" .  "~/Dropbox/orgfiles/gcal.org"))))

(use-package org-protocol 
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package yaml-mode
  :ensure t
  :mode "\\.yaml")

(use-package go-mode
  :ensure t
  :mode "\\.go"

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

(use-package css-mode
  :ensure t
  :mode "\\.css"
  :config
  :hook (css-mode . (lambda ()
              (add-to-list (make-local-variable 'company-backends)
                           '(company-css :width company-yasnippet :separate)))))

(use-package scss-mode
  :ensure t
  :mode "\\.scss")

;; Enable tide-mode for .ts and .tsx files
(use-package typescript-mode
  :ensure t
  :mode ("\\.ts$"
         "\\.js$")
  :hook ((typescript-mode . setup-tide-mode)))

(defun setup-tide-mode ()
  (message "Setting tide mode...")
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (prettier-js-mode)
  (company-mode +1)
  (tide-hl-identifier-mode +1)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (if (string-equal "tsx" (file-name-extension buffer-file-name))
      (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
    (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)))

(use-package tide
  :ensure t
  :after (flycheck typescript-mode))

(use-package web-mode
  :ensure t
  :after (tide)
  :mode ("\\.html\\'"
         "\\.php\\'"
         "\\.tsx\\'")
  :hook (web-mode . (lambda ()
                       (when (string-equal "tsx" (file-name-extension buffer-file-name))
                         (setup-tide-mode))))
  :config
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.tsx\\'")
          ("jsx" . "\\.js[x]?\\'")
          ("js" . "\\.mjs?\\'")
          ("html" . "\\.html\\'"))))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package py-autopep8
  :ensure t
  :hook (elpy-mode py-autopep8-enable-on-save))

(use-package python-mode
  :ensure t
  :mode "\\.py"
  :interpreter "py"
  :config
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt")

)

(use-package editorconfig
  :ensure t
  :init
  (editorconfig-mode 1))

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
