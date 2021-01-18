(setq gc-cons-threshold most-positive-fixnum)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(setq site-run-file nil)
(setq package-enable-at-startup nil)
(fset #'package--ensure-init-file #'ignore)

(setq frame-inhibit-implied-resize t)

(fset #'x-apply-session-resources #'ignore)

(setq comp-deferred-compilation nil)
