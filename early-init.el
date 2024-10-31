;;; -*- lexical-binding: t -*-

(when (featurep 'native-compile)
  ;; Set the right directory to store the native compilation cache
  (when (fboundp 'startup-redirect-eln-cache)
    (startup-redirect-eln-cache
     (convert-standard-filename
      (expand-file-name  "var/eln-cache/" user-emacs-directory))))
  (setq native-comp-async-report-warnings-errors 'silent)
  ;; Make native compilation happens asynchronously
  (setq native-comp-jit-compilation t))

(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq warning-minimum-level 'error)
(setq inhibit-startup-echo-area-message (user-login-name))

(setq initial-major-mode 'emacs-lisp-mode)
(setq inhibit-default-init t)
(setq site-run-file nil)
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)
(setq load-prefer-newer t)
(setq package-enable-at-startup nil)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

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
(push '(undecorated-round . t) default-frame-alist)
(push '(internal-border-width . 8) default-frame-alist)

;; Disables modeline until theme is loaded
(setq-default mode-line-format nil)

(set-face-foreground 'vertical-border "#0c0c0f")

;; This is needed by lps-mode
(setenv "LSP_USE_PLISTS" "true")


