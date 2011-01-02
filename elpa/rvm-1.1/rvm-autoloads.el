;;; rvm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (rvm-use rvm-activate-corresponding-ruby rvm-use-default)
;;;;;;  "rvm" "rvm.el" (19738 36584))
;;; Generated autoloads from rvm.el

(autoload (quote rvm-use-default) "rvm" "\
use the rvm-default ruby as the current ruby version

\(fn)" t nil)

(autoload (quote rvm-activate-corresponding-ruby) "rvm" "\
activate the corresponding ruby version for the file in the current buffer.
This function searches for an .rvmrc file and actiavtes the configured ruby.
If no .rvmrc file is found, the default ruby is used insted.

\(fn)" t nil)

(autoload (quote rvm-use) "rvm" "\
switch the current ruby version to any ruby, which is installed with rvm

\(fn NEW-RUBY NEW-GEMSET)" t nil)

;;;***

;;;### (autoloads nil nil ("rvm-pkg.el") (19738 36584 147896))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; rvm-autoloads.el ends here
