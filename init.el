;;; -*- lexical-binding: t -*-

(setopt custom-file
        (if (boundp 'server-socket-dir)
            (expand-file-name "custom.el" server-socket-dir)
          (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

(setopt auto-revert-avoid-polling t)
(setopt auto-revert-interval 5)
(setopt auto-revert-check-vc-info t)
(setopt sentence-end-double-space nil)
(setopt x-underline-at-descent-line nil)
(setopt switch-to-buffer-obey-display-actions t)
(setopt mouse-wheel-tilt-scroll t)
(setopt mouse-wheel-flip-direction t)
(setopt display-line-numbers-width 3)

(setq-default cursor-in-non-selected-windows nil)
(setq-default indicate-empty-lines nil)
(setq-default truncate-lines t)
(setq-default word-wrap t)

(setq ad-redefinition-action 'accept)
(setq auto-revert-stop-on-user-input nil)
(setq auto-revert-verbose t)
(setq auto-save-default t)
(setq auto-save-include-big-deletions t)
(setq auto-window-vscroll nil)
(setq backup-by-copying t)
(setq backup-by-copying-when-linked t)
(setq column-number-mode t)
(setq comint-buffer-maximum-size 2048)
(setq comint-prompt-read-only t)
(setq comment-empty-lines t)
(setq comment-multi-line t)
(setq compilation-always-kill t)
(setq compilation-ask-about-save nil)
(setq compilation-scroll-output 'first-error)
(setq confirm-nonexistent-file-or-buffer nil)
(setq create-lockfiles nil)
(setq delete-old-versions t)
(setq delete-pair-blink-delay 0.03)
(setq dired-clean-confirm-killing-deleted-buffers nil)
(setq dired-create-destination-dirs 'ask)
(setq dired-recursive-copies  'always)
(setq dired-recursive-deletes 'top)
(setq display-time-default-load-average nil)
(setq ediff-split-window-function #'split-window-horizontally)
(setq ediff-window-setup-function #'ediff-setup-windows-plain)
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq fast-but-imprecise-scrolling t)
(setq ffap-machine-p-known 'reject)
(setq find-file-suppress-same-file-warnings t)
(setq find-file-visit-truename t)
(setq frame-resize-pixelwise t)
(setq global-text-scale-adjust-resizes-frames nil)
(setq highlight-nonselected-windows nil)
(setq hscroll-margin 2)
(setq hscroll-step 1)
(setq idle-update-delay 1.0)
(setq kept-new-versions 5)
(setq kept-old-versions 5)
(setq kill-buffer-delete-auto-save-files t)
(setq kill-do-not-save-duplicates t)
(setq lazy-highlight-initial-delay 0)
(setq line-number-mode t)
(setq make-backup-files nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . hscroll)))
(setq mouse-wheel-scroll-amount-horizontal 1)
(setq mouse-yank-at-point t)
(setq recentf-auto-cleanup 'mode)
(setq recentf-max-saved-items 300) ; default is 20
(setq require-final-newline t)
(setq resize-mini-windows 'grow-only)
(setq revert-without-query (list "."))
(setq ring-bell-function #'ignore)
(setq scroll-conservatively 10000)
(setq scroll-error-top-bottom t)
(setq scroll-margin 0)
(setq scroll-preserve-screen-position t)
(setq scroll-step 1)
(setq sentence-end-double-space nil)
(setq sh-indent-after-continuation 'always)
(setq show-paren-delay 0.1)
(setq show-paren-highlight-openparen t)
(setq show-paren-when-point-in-periphery t)
(setq show-paren-when-point-inside-paren t)
(setq switch-to-buffer-obey-display-actions t)
(setq truncate-partial-width-windows nil)
(setq truncate-string-ellipsis "…")
(setq uniquify-buffer-name-style 'forward)
(setq vc-follow-symlinks t)
(setq vc-make-backup-files nil)
(setq version-control t)
(setq visible-bell nil)
(setq warning-suppress-types '((lexical-binding)))
(setq whitespace-line-column nil)
(setq window-divider-default-bottom-width 1)
(setq window-divider-default-places t)
(setq window-divider-default-right-width 1)
(setq window-resize-pixelwise nil)

(add-hook 'after-init-hook #'window-divider-mode)

(if (fboundp #'json-parse-string)
    (push 'jansson features))

(if (string-match-p "HARFBUZZ" system-configuration-features)
    (push 'harfbuzz features))

(if (bound-and-true-p module-file-suffix)
    (push 'dynamic-modules features))

(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t face
                  minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add #'yes-or-no-p :override #'y-or-n-p))
(defalias #'view-hello-file #'ignore)  ; Never show the hello file

;; Elpaca

(defvar elpaca-installer-version 0.8)
(defvar elpaca-directory
  (locate-user-emacs-file
   (concat
    (file-name-as-directory "var/elpaca")
    emacs-version)))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))

(defvar elpaca-order
  '(elpaca :repo "https://github.com/progfolio/elpaca.git"
           :ref nil :depth 1
           :files (:defaults "elpaca-test.el" (:exclude "extensions"))
           :build (:not elpaca--activate-package)))

(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))

(add-hook 'after-init-hook #'elpaca-process-queues)

(elpaca `(,@elpaca-order))

(elpaca-wait)

(require 'use-package)

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

;; ;; Uncomment this to see the list of loaded packages
;; (setq use-package-verbose 
(setq use-package-always-ensure t)

(use-package no-littering
  :ensure (:wait t)
  :demand t)

(setq package-check-signature nil)

;; Updates public keyring and reverts package-check-signature
(use-package gnu-elpa-keyring-update
  :ensure (:wait t)
  :init
  (setq package-check-signature 'allow-unsigned))

(use-package system-packages
  :ensure (:wait t)
  :demand t
  :custom
  (system-packages-package-manager 'brew))

;; ;; Track max-specpdl-size exceded error by uncommenting this
;; (setq max-specpdl-size 5)
;; (setq debug-on-error t)

(use-package org
  :ensure (:wait t)
  :demand t)

(use-package org-contrib
  :ensure (:wait t)
  :after org)

(fset #'x-apply-session-resources #'ignore)


;; Inject PATH from shell
(use-package exec-path-from-shell
  :custom
  (exec-path-from-shell-variables '("PATH" "MANPATH" "LSP_USE_PLISTS" "GOPATH"))
  (exec-path-from-shell-arguments '("-l"))
  :config
  (when (or (memq window-system '(ns x))
            (daemonp))
    (exec-path-from-shell-initialize)))

;; Load org literal config config
(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

;; Load custom-file after all packages have ben initialized
(add-hook 'elpaca-after-init-hook
          (lambda ()
            (load custom-file 'noerror 'nomessage)))

(put 'dired-find-alternate-file 'disabled nil)
