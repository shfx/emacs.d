;;; -*- lexical-binding: t -*-

;; See the summary to learn more
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Startup-Summary.html

;; We use elpaca so we need to disable package.el initialization

(setq package-enable-at-startup nil)
(setq package-quickstart nil)

;; Select default encoding

(set-language-environment "UTF-8")

;; Byte compile

(setopt load-prefer-newer t)

(when (featurep 'native-compile)
  ;; Set the right directory to store the native compilation cache
  (when (fboundp 'startup-redirect-eln-cache)
    (startup-redirect-eln-cache
     (convert-standard-filename
      (expand-file-name  "var/eln-cache/" user-emacs-directory))))
  (setopt native-comp-async-report-warnings-errors 'silent)
  ;; Make native compilation happens asynchronously
  (setopt native-comp-jit-compilation t)
  (setopt package-native-compile t))

;; Make emacs less verbose

(setopt byte-compile-verbose nil)
(setopt warning-minimum-level :error)
(setopt warning-suppress-log-types '((comp) (bytecomp)))

;; set custom variable should be done by setopt but
;; byte-compile-warnings does not allow not keyword
(setq byte-compile-warnings '(not obsolete))
;; (setopt byte-compile-warnings '(not obsolete))

;; Speed & optimization

(setopt auto-mode-case-fold nil)
(setopt bidi-inhibit-bpa t)
(setopt inhibit-compacting-font-caches t)
(setopt read-process-output-max (* 1024 1024)) ;; 1mb
(setopt inhibit-default-init t)
(setopt inhibit-x-resources t)
(setq site-run-file nil)
(setq bidi-display-reordering 'left-to-right)
(setq bidi-paragraph-direction 'left-to-right)

;; Preferences

(setopt frame-inhibit-implied-resize t)
(setopt frame-resize-pixelwise t)
(setopt default-input-method nil)
(setopt use-dialog-box nil)
(setopt use-file-dialog nil)
(setopt inhibit-splash-screen t)
(setopt inhibit-startup-buffer-menu t)

(setopt inhibit-startup-screen t)
(setopt initial-buffer-choice nil)
(setopt initial-major-mode 'fundamental-mode)
(setopt initial-scratch-message nil)

;; Disable GC before while we load rest of the config

(defvar my/pre-init-file-name-handler-alist file-name-handler-alist)
(defvar my/pre-init-gc-cons-threshold 100000000) ;; or gc-cons-threshold
(defvar my/pre-init-gc-cons-percentage gc-cons-percentage)

(setq file-name-handler-alist nil
      gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(defun restore-post-init-settings ()
  "Restore some values previously savet in early-init.el"
  (setq file-name-handler-alist my/pre-init-file-name-handler-alist
        gc-cons-threshold my/pre-init-gc-cons-threshold
        gc-cons-percentage my/pre-init-gc-cons-percentage)
  (message "Restore previous GC threshold and file-name-handler-alist values"))

(add-hook 'after-init-hook
          (lambda ()
            (when (functionp 'restore-post-init-settings)
              (restore-post-init-settings))))

;; Set default-frame-alist before init.el

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(push '(horizontal-scroll-bars . nil) default-frame-alist)
(push '(ns-appearance . dark) default-frame-alist)
(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(fullscreen . maximized) default-frame-alist)
(push '(internal-border-width . 8) default-frame-alist)

;; Disables modeline until theme is loaded and set vertical border

(setq-default mode-line-format nil)
(set-face-foreground 'vertical-border "#0c0c0f")

;; This is needed by lsp-mode

(setenv "LSP_USE_PLISTS" "true")
