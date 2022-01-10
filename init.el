(require 'package)

(package-initialize)

;; Package management
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; All packages should be ensured unless stated othewise
(require 'use-package)
(setq use-package-always-ensure t)

;; Garbage Collector Magic Hack
(use-package gcmh
  :config
  (gcmh-mode 1))

;; Install newer version of org-mode
(use-package org
  :pin gnu
  :commands (org-mode org-capture org-agenda orgbl-mode)
  :mode (("\\.org$" . org-mode)))

(use-package org-contrib
  :pin nongnu
  :after org)

;; ;; Track max-specpdl-size exceded error by uncommenting this
;; (setq max-specpdl-size 5)
;; (setq debug-on-error t)

;; Load org literal config config
(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

(setq custom-file
      (if (boundp 'server-socket-dir)
          (expand-file-name "custom.el" server-socket-dir)
        (expand-file-name (format "emacs-custom-%s.el" (user-uid)) temporary-file-directory)))

(load custom-file t)
(put 'narrow-to-region 'disabled nil)
