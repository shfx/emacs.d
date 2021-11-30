(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024))

(when (boundp 'comp-eln-load-path)
  (setcar comp-eln-load-path
	  (expand-file-name "var/eln-cache/" user-emacs-directory)))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq site-run-file nil)
(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)

(setq byte-compile-warnings '(cl-functions))

(fset #'x-apply-session-resources #'ignore)

;; Set default-frame-alist before init.el
(push '(font . "Monaco 14") default-frame-alist)
(push '(foreground-color . "#d6d6d4") default-frame-alist)
(push '(background-color . "#1c1e1f") default-frame-alist)
(push '(ns-appearance . dark) default-frame-alist)
(push '(ns-transparent-titlebar . t) default-frame-alist)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Set initial-frame-alist before init.el
(push '(fullscreen . maximized) initial-frame-alist)

(setq-default comp-deferred-compilation nil)
