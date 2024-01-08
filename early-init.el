;; Prefer loading newest compiled .el file
(setq load-prefer-newer noninteractive)

;; Native compilation settings
(when (featurep 'native-compile)
  ;; Silence compiler warnings as they can be pretty disruptive
  (setq native-comp-async-report-warnings-errors :silent)
  ;; Make native compilation happens asynchronously
  (setq native-comp-jit-compilation t)
  ;; Set the right directory to store the native compilation cache
  (add-to-list 'native-comp-eln-load-path (expand-file-name "var/eln-cache/" user-emacs-directory)))
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
(push '(font . "Monaco 14") default-frame-alist)
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
(setq initial-major-mode 'fundamental-mode)

(setq inhibit-default-init t)
(setq site-run-file nil)
(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)
(setq byte-compile-warnings '(cl-functions))

(fset #'x-apply-session-resources #'ignore)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
