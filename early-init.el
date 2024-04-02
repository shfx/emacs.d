(when (featurep 'native-compile)
  ;; Silence compiler warnings as they can be pretty disruptive
  (setq-default native-comp-async-report-warnings-errors :silent)
  ;; Make native compilation happens asynchronously
  (setq-default native-comp-jit-compilation t)
  ;; Set the right directory to store the native compilation cache
  (when (fboundp 'startup-redirect-eln-cache)
    (startup-redirect-eln-cache
     (convert-standard-filename
      (expand-file-name  "var/eln-cache/" user-emacs-directory)))))

;; This is needed by lps-mode
(setenv "LSP_USE_PLISTS" "true")

(setq package-user-dir
      (locate-user-emacs-file
       (concat
        (file-name-as-directory "var/packages")
        emacs-version)))

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(defvar my/pre-init-file-name-handler-alist file-name-handler-alist)
(defvar my/pre-init-gc-cons-threshold gc-cons-threshold)
(defvar my/pre-init-gc-cons-percentage gc-cons-percentage)

(setq file-name-handler-alist nil
      gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(defun restore-post-init-settings ()
  "Restore some values previously savet in early-init.el"
  (setq file-name-handler-alist my/pre-init-file-name-handler-alist
        gc-cons-threshold my/pre-init-gc-cons-threshold
        gc-cons-percentage my/pre-init-gc-cons-percentage))

;; Set default-frame-alist before init.el
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(foreground-color . "#d6d6d4") default-frame-alist)
(push '(background-color . "#1c1e1f") default-frame-alist)
(push '(ns-appearance . dark) default-frame-alist)
(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(fullscreen . maximized) initial-frame-alist)

;; Disables modeline until theme is loaded
(setq-default mode-line-format nil)

(set-face-foreground 'vertical-border "#171819")

;; Make the initial buffer load faster by setting its mode to fundamental-mode
(setq initial-major-mode 'emacs-lisp-mode)
(setq inhibit-default-init t)
(setq site-run-file nil)
(setq frame-inhibit-implied-resize t)
(setq byte-compile-warnings '(cl-functions))
(setq load-prefer-newer t)
