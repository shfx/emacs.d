; usuwanie spashscreena
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq emacsdir "~/.emacs.d") ; main config dir
(setq elpa-dir (concat emacsdir "/elpa")) ; elpa packages dir
(setq plugins-dir (concat emacsdir "/plugins")) ; not-elpa'd plugins
(add-to-list 'load-path plugins-dir) ; set up plugins paths

; elip
(when
    (load (expand-file-name (concat elpa-dir "/package.el")))
  (package-initialize))

; ido
(require 'ido)
(ido-mode t)

; podswietlanie zaznaczenia
(setq transient-mark-mode t)
(setq delete-selection-mode 1)
(setq show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq delete-key-deletes-forward t)
(setq mouse-yank-at-point t)

(line-number-mode t)
(column-number-mode t)

; czysty start

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; mod do PHP
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php\\'\\|\\.phtml\\'" . php-mode))

; mod do JSa
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; skrot do goto-line
(global-set-key "\C-l"     'goto-line)         ; [Ctrl]-[L]

; zamienia prompty yes/no na y/n
(fset 'yes-or-no-p 'y-or-n-p)

(require 'font-lock)
(global-font-lock-mode t)

(setq auto-mode-alist (cons '("\.emacs" . lisp-mode) auto-mode-alist))
(setq display-time-day-and-date t
  display-time-24hr-format t)

(display-time)

(require 'tramp)

(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))

(defun goto-file ()
  "goto file."
 (interactive)
 (let (myword)
   (setq myword
    (if (and transient-mark-mode mark-active)
       (buffer-substring-no-properties (region-beginning) (region-end))
       (thing-at-point 'symbol))
     )
   (setq myword (concat "~/html/data/all/" myword ".php"))
   (find-file myword)
  )
)

(global-set-key (kbd "<f6>") 'goto-file)

(custom-set-variables
 '(javascript-auto-indent-flag t)
 '(javascript-indent-level 2)
 '(js2-auto-indent-p t)
 '(js2-basic-offset (if (and (boundp (quote c-basic-offset)) (numberp c-basic-offset)) c-basic-offset 2))
 '(js2-bounce-indent-p nil)
 '(js2-cleanup-whitespace t)
 '(js2-enter-indents-newline nil)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key nil)
 '(js2-mirror-mode nil)
 '(js2-mode-escape-quotes nil)
 '(js2-mode-indent-inhibit-undo t)
 '(js2-move-point-on-right-click nil)
 '(js2-rebind-eol-bol-keys t))

(message ".emacs loaded successfully.")
