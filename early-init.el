(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024))

;; Prefer loading newest compiled .el file
(setq load-prefer-newer noninteractive)

;; Native compilation settings
(when (featurep 'native-compile)
  ;; Silence compiler warnings as they can be pretty disruptive
  (setq native-comp-async-report-warnings-errors nil)
  ;; Make native compilation happens asynchronously
  (setq native-comp-deferred-compilation t)
  ;; Set the right directory to store the native compilation cache
  (add-to-list 'native-comp-eln-load-path (expand-file-name "var/eln-cache/" user-emacs-directory)))

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
