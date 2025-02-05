;;; -*- lexical-binding: t -*-

(setopt custom-file
        (if (boundp 'server-socket-dir)
            (expand-file-name "custom.el" server-socket-dir)
          (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

;; ;; Track max-specpdl-size exceded error by uncommenting this
;; (setq max-specpdl-size 5)
;; (setq debug-on-error t)

(setopt ad-redefinition-action 'accept)
(setopt auto-revert-avoid-polling t)
(setopt auto-revert-check-vc-info t)
(setopt auto-revert-interval 1)
(setopt auto-revert-stop-on-user-input nil)
(setopt auto-revert-verbose t)
(setopt auto-save-default t)
(setopt auto-save-include-big-deletions t)
(setopt auto-window-vscroll nil)
(setopt backup-by-copying t)
(setopt backup-by-copying-when-linked t)
(setopt column-number-mode t)
(setopt comint-buffer-maximum-size 2048)
(setopt comint-prompt-read-only t)
(setopt comment-empty-lines t)
(setopt comment-multi-line t)
(setopt compilation-always-kill t)
(setopt compilation-ask-about-save nil)
(setopt compilation-scroll-output 'first-error)
(setopt confirm-nonexistent-file-or-buffer nil)
(setopt create-lockfiles nil)
(setopt cursor-in-non-selected-windows nil)
(setopt delete-old-versions t)
(setopt delete-pair-blink-delay 0.03)
(setopt dired-clean-confirm-killing-deleted-buffers nil)
(setopt dired-create-destination-dirs 'ask)
(setopt dired-recursive-copies  'always)
(setopt dired-recursive-deletes 'top)
(setopt display-line-numbers-width 3)
(setopt display-time-default-load-average nil)
(setopt ediff-split-window-function #'split-window-horizontally)
(setopt ediff-window-setup-function #'ediff-setup-windows-plain)
(setopt eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setopt fast-but-imprecise-scrolling t)
(setopt ffap-machine-p-known 'reject)
(setopt find-file-suppress-same-file-warnings t)
(setopt find-file-visit-truename t)
(setopt frame-resize-pixelwise t)
(setopt global-text-scale-adjust-resizes-frames nil)
(setopt highlight-nonselected-windows nil)
(setopt hscroll-margin 2)
(setopt hscroll-step 1)
(setopt idle-update-delay 0.5)
(setopt indicate-empty-lines nil)
(setopt kept-new-versions 5)
(setopt kept-old-versions 5)
(setopt kill-buffer-delete-auto-save-files t)
(setopt kill-do-not-save-duplicates t)
(setopt lazy-highlight-initial-delay 0)
(setopt mac-command-modifier 'super)
(setopt mac-option-modifier 'meta)
(setopt make-backup-files nil)
(setopt mouse-wheel-flip-direction t)
(setopt mouse-wheel-scroll-amount '(1 ((shift) . hscroll)))
(setopt mouse-wheel-scroll-amount-horizontal 1)
(setopt mouse-wheel-tilt-scroll t)
(setopt mouse-yank-at-point t)
(setopt recentf-auto-cleanup 'mode)
(setopt recentf-max-saved-items 300) ; default is 20
(setopt resize-mini-windows 'grow-only)
(setopt revert-without-query (list "."))
(setopt ring-bell-function #'ignore)
(setopt scroll-conservatively 0)
(setopt scroll-error-top-bottom t)
(setopt scroll-margin 15)
(setopt scroll-preserve-screen-position t)
(setopt scroll-step 1)
(setopt sentence-end-double-space nil)
(setopt sh-indent-after-continuation 'always)
(setopt show-paren-delay 0.1)
(setopt show-paren-highlight-openparen t)
(setopt show-paren-when-point-in-periphery t)
(setopt show-paren-when-point-inside-paren t)
(setopt switch-to-buffer-obey-display-actions t)
(setopt truncate-lines t)
(setopt truncate-partial-width-windows nil)
(setopt truncate-string-ellipsis "…")
(setopt uniquify-buffer-name-style 'forward)
(setopt vc-follow-symlinks t)
(setopt vc-make-backup-files nil)
(setopt version-control t)
(setopt visible-bell nil)
(setopt warning-suppress-types '((lexical-binding)))
(setopt window-divider-default-bottom-width 1)
(setopt window-divider-default-places t)
(setopt window-divider-default-right-width 1)
(setopt window-resize-pixelwise nil)
(setopt x-underline-at-descent-line nil)

(add-hook 'after-init-hook #'window-divider-mode)

(if (fboundp #'json-parse-string)
    (push 'jansson features))

(if (string-match-p "HARFBUZZ" system-configuration-features)
    (push 'harfbuzz features))

(if (bound-and-true-p module-file-suffix)
    (push 'dynamic-modules features))

(setopt minibuffer-prompt-properties
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

;; Uncomment this to see the list of loaded packages
;; (setq use-package-verbose t)

(setq use-package-always-ensure t)

(use-package no-littering
  :ensure (:wait t)
  :demand t)

(setq package-check-signature nil)

;; Updates public keyring and reverts package-check-signature
;; (use-package gnu-elpa-keyring-update
;;   :ensure (:wait t)
;;   :init
;;   (setq package-check-signature 'allow-unsigned))

(use-package system-packages
  :ensure (:wait t)
  :demand t)

(use-package org
  :ensure (:wait t)
  :demand t)

(use-package seq
  :ensure (:wait t)
  :demand t)

(use-package org-contrib
  :ensure (:wait t)
  :after org)

(fset #'x-apply-session-resources #'ignore)

;; Inject PATH from shell
(use-package exec-path-from-shell
  :functions exec-path-from-shell-initialize
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
