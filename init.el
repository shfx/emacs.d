;;; -*- lexical-binding: t -*-

(setopt custom-file
        (if (boundp 'server-socket-dir)
            (expand-file-name "custom.el" server-socket-dir)
          (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

;; ;; Track max-specpdl-size exceded error by uncommenting this
;; (setq max-specpdl-size 5)
;; (setq debug-on-error t)

(setopt
 ad-redefinition-action 'accept
 auto-revert-avoid-polling t
 auto-revert-check-vc-info t
 auto-revert-interval 1
 auto-revert-stop-on-user-input nil
 auto-revert-verbose t
 auto-save-default t
 auto-save-include-big-deletions t
 auto-window-vscroll nil
 backup-by-copying t
 backup-by-copying-when-linked t
 column-number-mode t
 comint-buffer-maximum-size 2048
 comint-prompt-read-only t
 comment-empty-lines t
 comment-multi-line t
 compilation-always-kill t
 compilation-ask-about-save nil
 compilation-scroll-output 'first-error
 confirm-nonexistent-file-or-buffer nil
 create-lockfiles nil
 cursor-in-non-selected-windows nil
 delete-old-versions t
 delete-pair-blink-delay 0.03
 dired-clean-confirm-killing-deleted-buffers nil
 dired-create-destination-dirs 'ask
 dired-recursive-copies 'always
 dired-recursive-deletes 'top
 display-line-numbers-width 3
 display-time-default-load-average nil
 ediff-split-window-function #'split-window-horizontally
 ediff-window-setup-function #'ediff-setup-windows-plain
 eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
 ffap-machine-p-known 'reject
 find-file-suppress-same-file-warnings t
 find-file-visit-truename t
 frame-resize-pixelwise t
 global-text-scale-adjust-resizes-frames nil
 highlight-nonselected-windows nil
 hscroll-margin 2
 hscroll-step 1
 idle-update-delay 0.5
 indicate-empty-lines nil
 kept-new-versions 5
 kept-old-versions 5
 kill-buffer-delete-auto-save-files t
 kill-do-not-save-duplicates t
 lazy-highlight-initial-delay 0
 mac-command-modifier 'super
 mac-option-modifier 'meta
 make-backup-files nil
 mouse-wheel-flip-direction t
 mouse-wheel-scroll-amount '(1 ((shift) . hscroll))
 mouse-wheel-scroll-amount-horizontal 1
 mouse-wheel-tilt-scroll t
 mouse-yank-at-point t
 recentf-auto-cleanup 'mode
 recentf-max-saved-items 300
 resize-mini-windows 'grow-only
 revert-without-query (list ".")
 ring-bell-function #'ignore
 scroll-conservatively 0
 scroll-error-top-bottom t
 scroll-margin 15
 scroll-preserve-screen-position t
 scroll-step 1
 sentence-end-double-space nil
 sh-indent-after-continuation 'always
 show-paren-delay 0.1
 show-paren-highlight-openparen t
 show-paren-when-point-in-periphery t
 show-paren-when-point-inside-paren t
 switch-to-buffer-obey-display-actions t
 truncate-lines t
 truncate-partial-width-windows nil
 truncate-string-ellipsis "…"
 uniquify-buffer-name-style 'forward
 vc-follow-symlinks t
 vc-make-backup-files nil
 version-control t
 visible-bell nil
 warning-suppress-types '((lexical-binding))
 window-divider-default-bottom-width 1
 window-divider-default-places t
 window-divider-default-right-width 1
 window-resize-pixelwise nil
 x-underline-at-descent-line nil)

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

(load-file (expand-file-name "elpaca.el" user-emacs-directory))

(use-package no-littering
  :ensure (:wait t)
  :demand t)

(use-package system-packages
  :ensure (:wait t)
  :demand t
  :custom
  (system-packages-noconfirm t))

(use-package org
  :ensure (:wait t)
  :demand t)

(use-package org-contrib
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

(elpaca-wait)

;; Load org literal config config
(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

;; Load custom-file after all packages have ben initialized
(add-hook 'elpaca-after-init-hook
          (lambda ()
            (load custom-file 'noerror 'nomessage)))

(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
