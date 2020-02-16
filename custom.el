(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-hook (quote org-mode-hook) t)
 '(ansi-color-names-vector
   ["#222323" "#e74c3c" "#b6e63e" "#e2c770" "#268bd2" "#fb2874" "#66d9ef" "#d6d6d4"])
 '(auto-package-update-delete-old-versions t)
 '(auto-package-update-hide-results t)
 '(browse-url-chrome-program
   "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome")
 '(comint-output-filter-functions
   (quote
    (comint-postoutput-scroll-to-bottom comint-watch-for-password-prompt)) t)
 '(company-box-enable-icon t)
 '(company-box-icons-alist (quote company-box-icons-all-the-icons))
 '(company-quickhelp-mode t)
 '(company-transformers (quote (company-sort-by-backend-importance)))
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "d3e333eaa461c82a124f7e7a7a9637d56fc3019478becb1847952804ca67743e" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "ab564a7ce7f2b2ad9e2cfe9fe1019b5481809dd7a0e36240c9139e230cc2bc32" "144f05e2dfa7a7b50cad0c3519498ac064cc9da1f194b8ea27d0fb20129d8d7a" "a4df5d4a4c343b2712a8ed16bc1488807cd71b25e3108e648d4a26b02bc990b3" "eecacf3fb8efc90e6f7478f6143fd168342bbfa261654a754c7d47761cec07c8" "12b204c8fcce23885ce58e1031a137c5a14461c6c7e1db81998222f8908006af" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" "412206319b30011cf38b45e63466f16473e8afee0854bebba3bab54a7d43ce74" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" "557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "be4025b1954e4ac2a6d584ccfa7141334ddd78423399447b96b6fa582f206194" "fa942713c74b5ad27893e72ed8dccf791c9d39e5e7336e52d76e7125bfa51d4c" default)))
 '(dash-at-point-mode-alist
   (quote
    ((actionscript-mode . "actionscript")
     (arduino-mode . "arduino")
     (c++-mode . "cpp,net,boost,qt,cvcpp,cocos2dx,c,manpages")
     (c-mode . "c,glib,gl2,gl3,gl4,manpages")
     (caml-mode . "ocaml")
     (clojure-mode . "clojure")
     (coffee-mode . "coffee")
     (common-lisp-mode . "lisp")
     (cperl-mode . "perl")
     (css-mode . "css,bootstrap,foundation,less,awesome,cordova,phonegap")
     (dart-mode . "dartlang,polymerdart,angulardart")
     (elixir-mode . "elixir")
     (emacs-lisp-mode . "elisp")
     (enh-ruby-mode . "ruby")
     (erlang-mode . "erlang")
     (gfm-mode . "markdown")
     (go-mode . "go,godoc")
     (groovy-mode . "groovy")
     (haml-mode . "haml")
     (haskell-mode . "haskell")
     (html-mode . "html,svg,css,bootstrap,foundation,awesome,javascript,jquery,jqueryui,jquerym,angularjs,backbone,marionette,meteor,moo,prototype,ember,lodash,underscore,sencha,extjs,knockout,zepto,cordova,phonegap,yui")
     (jade-mode . "jade")
     (java-mode . "java,javafx,grails,groovy,playjava,spring,cvj,processing,javadoc")
     (js2-mode . "javascript,backbone,angularjs")
     (js3-mode . "nodejs")
     (latex-mode . "latex")
     (less-css-mode . "less")
     (lua-mode . "lua,corona")
     (markdown-mode . "markdown")
     (nginx-mode . "nginx")
     (objc-mode . "cpp,iphoneos,macosx,appledoc,cocoapods,cocos2dx,cocos2d,cocos3d,kobold2d,sparrow,c,manpages")
     (perl-mode . "perl,manpages")
     (php-mode . "php,wordpress,drupal,zend,laravel,yii,joomla,ee,codeigniter,cakephp,phpunit,symfony,typo3,twig,smarty,phpp,html,mysql,sqlite,mongodb,psql,redis")
     (processing-mode . "processing")
     (puppet-mode . "puppet")
     (python-mode . "python3,django,twisted,sphinx,flask,tornado,sqlalchemy,numpy,scipy,saltcvp")
     (ruby-mode . "ruby,rubygems,rails")
     (rust-mode . "rust")
     (sass-mode . "sass,compass,bourbon,neat,css")
     (scala-mode . "scala,akka,playscala,scaladoc")
     (stylus-mode . "stylus")
     (tcl-mode . "tcl")
     (tuareg-mode . "ocaml")
     (twig-mode . "twig")
     (vim-mode . "vim")
     (yaml-mode . "chef,ansible")
     (web-mode . "javascript,html,css,react,nodejs"))))
 '(dashboard-banner-logo-title "Welcome to Emacs" t)
 '(dashboard-center-content t)
 '(dashboard-items
   (quote
    ((recents . 3)
     (agenda . 5)
     (projects . 5)
     (registers . 5))) t)
 '(dashboard-navigator-buttons
   (quote
    ((#("" 0 1
        (face
         (:family "github-octicons" :height 1.32)
         font-lock-face
         (:family "github-octicons" :height 1.32)
         display
         (raise 0.0)
         rear-nonsticky t))
      "Homepage" "Browse homepage"
      (lambda
        (&rest _)
        (browse-url "homepage")))
     ("★" "Star" "Show stars"
      (lambda
        (&rest _)
        (show-stars))
      (quote warning))
     ("?" "Help" "?/h"
      (function show-help)
      nil "<" ">"))) t)
 '(dashboard-set-file-icons t)
 '(dashboard-set-heading-icons t)
 '(dashboard-show-shortcuts nil)
 '(dashboard-startup-banner (quote logo) t)
 '(dimmer-buffer-exclusion-regexps
   (quote
    ("^\\*[h|H]elm.*\\*" "^\\*Minibuf-[0-9]+\\*" "^.\\*which-key\\*$" "^*Messages*" "*LV*")))
 '(dimmer-fraction 0.35)
 '(dimmer-prevent-dimming-predicates (quote (helm--alive-p window-minibuffer-p)))
 '(doom-modeline-buffer-modification-icon t)
 '(doom-modeline-buffer-state-icon t)
 '(doom-modeline-checker-simple-format t)
 '(doom-modeline-icon t)
 '(doom-modeline-major-mode-color-icon t)
 '(doom-modeline-major-mode-icon t)
 '(doom-modeline-minor-modes nil)
 '(doom-themes-enable-bold nil)
 '(doom-themes-enable-italic nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-autodoc elpy-module-sane-defaults)))
 '(enable-recursive-minibuffers t)
 '(eshell-banner-message "")
 '(eshell-destroy-buffer-when-process-dies t)
 '(eshell-error-if-no-glob t)
 '(eshell-highlight-prompt nil)
 '(eshell-hist-ignoredups t)
 '(eshell-output-filter-functions
   (quote
    (eshell-postoutput-scroll-to-bottom eshell-handle-control-codes eshell-watch-for-password-prompt)))
 '(eshell-prefer-lisp-functions nil)
 '(eshell-prompt-function
   (lambda nil
     (let
         ((base/dir
           (shrink-path-prompt default-directory)))
       (concat
        (propertize
         (car base/dir)
         (quote face)
         (quote font-lock-comment-face))
        (propertize
         (cdr base/dir)
         (quote face)
         (quote font-lock-constant-face))
        (propertize " ❯"
                    (quote face)
                    (quote eshell-prompt-face))
        (propertize " "
                    (quote face)
                    (quote default))))) t)
 '(eshell-prompt-regexp "^.*❯ " t)
 '(eshell-save-history-on-exit t)
 '(eshell-scroll-to-bottom-on-input (quote all))
 '(eshell-toggle-name-separator " ❯ " t)
 '(eshell-toggle-run-command nil)
 '(eshell-toggle-size-fraction 3 t)
 '(eshell-toggle-use-projectile-root t t)
 '(eshell-visual-commands
   (quote
    ("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm" "htop" "ctop")))
 '(exec-path-from-shell-arguments nil)
 '(fci-rule-color "#555556")
 '(flycheck-javascript-flow-args nil)
 '(gc-cons-threshold 16777216)
 '(git-gutter:update-interval 2)
 '(global-eldoc-mode t)
 '(global-flycheck-mode nil)
 '(global-nlinum-mode nil)
 '(helm-M-x-fuzzy-match t t)
 '(helm-display-function (quote pop-to-buffer))
 '(helm-display-header-line nil)
 '(helm-ff-lynx-style-map t)
 '(helm-show-completion-display-function (quote helm-show-completion-default-display-function))
 '(helm-split-window-preferred-function (quote ignore))
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-symbol-idle-delay 0.2)
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(inhibit-compacting-font-caches t t)
 '(initial-buffer-choice "~/")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ivy-format-functions-alist
   (quote
    ((swiper-isearch . swiper-isearch-format-function)
     (swiper-all . swiper--all-format-function)
     (swiper-multi . swiper--all-format-function)
     (t . ivy-format-function-arrow))))
 '(ivy-posframe-display-functions-alist
   (quote
    ((swiper . ivy-posframe-display)
     (complete-symbol . ivy-posframe-display)
     (counsel-M-x . ivy-posframe-display)
     (t . ivy-posframe-display))))
 '(ivy-use-virtual-buffers t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#525254"))
 '(js-switch-indent-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-indent-switch-body t)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(js3-allow-keywords-as-property-names nil)
 '(js3-auto-indent-p t)
 '(js3-consistent-level-indent-inner-bracket t)
 '(js3-curly-indent-offset 0)
 '(js3-enter-indents-newline t)
 '(js3-expr-indent-offset 2)
 '(js3-indent-on-enter-key t)
 '(js3-lazy-commas t)
 '(js3-lazy-dots t)
 '(js3-lazy-operators t)
 '(js3-mirror-mode t)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(left-fringe-width 16 t)
 '(ls-lisp-use-insert-directory-program t)
 '(minibuffer-auto-raise t)
 '(minibuffer-frame-alist (quote ((width . 80) (height . 3))))
 '(minibuffer-prompt-properties (quote (read-only t face minibuffer-prompt)))
 '(neo-theme (quote icons))
 '(nlinum-use-right-margin nil)
 '(nlinum-widen nil)
 '(ns-right-alternate-modifier (quote none))
 '(ns-use-proxy-icon nil t)
 '(org-agenda-block-separator "")
 '(org-agenda-files
   (quote
    ("~/.orgfiles/Inbox.org" "~/.orgfiles/links.org" "~/.orgfiles/todo.org" "~/.orgfiles/journal.org")))
 '(org-babel-min-lines-for-block-output 1 t)
 '(org-capture-templates
   (quote
    (("a" "Appointment" entry
      (file "~/.orgfiles/gcal.org")
      "* %?

%^T

:PROPERTIES:

:END:

")
     ("l" "Link" entry
      (file+headline "~/.orgfiles/links.org" "Links")
      "* %? %^L %^g
%T" :prepend t)
     ("b" "Blog idea" entry
      (file+headline "~/.orgfiles/todo.org" "Blog Topics:")
      "* %?
%T" :prepend t)
     ("t" "Todo Item" entry
      (file+headline "~/.orgfiles/todo.org" "Todo")
      "* TODO %?
:PROPERTIES:
:CREATED: %u
:END:" :prepend t :empty-lines 1)
     ("n" "Note" entry
      (file+headline "~/.orgfiles/todo.org" "Note space")
      "* %?
%u" :prepend t)
     ("j" "Journal" entry
      (file+olp+datetree "~/.orgfiles/journal.org")
      "* %?
Entered on %U
  %i
  %a"))))
 '(org-default-notes-file "~/org/notes.org")
 '(org-ellipsis "  ")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-hide-emphasis-markers t)
 '(org-indent-indentation-per-level 1)
 '(org-modules
   (quote
    (org-protocol org-eshell org-habit org-mouse org-tempo org-notify org-mac-link org-mac-iCal org-panel)) nil nil "Customized with use-package org")
 '(org-pretty-entities t)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 1))))
 '(org-speed-command-help t t)
 '(org-src-preserve-indentation t)
 '(org-startup-folded "showeverything")
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-sticky-header-always-show-header nil)
 '(org-sticky-header-full-path (quote full))
 '(org-sticky-header-heading-star "●")
 '(org-sticky-header-outline-path-separator " / ")
 '(org-super-agenda-groups
   (quote
    ((:name "Today" :time-grid t :todo "TODAY")
     (:name "Important" :tag "bills" :priority "A")
     (:order-multi
      (2
       (:name "Shopping in town" :and
              (:tag "shopping" :tag "@town"))
       (:name "Food-related" :tag
              ("food" "dinner"))
       (:name "Personal" :habit t :tag "personal")
       (:name "Space-related (non-moon-or-planet-related)" :and
              (:regexp
               ("space" "NASA")
               :not
               (:regexp "moon" :tag "planet")))))
     (:todo "WAITING" :order 8)
     (:todo
      ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
      :order 9)
     (:priority<= "B" :order 1))))
 '(org-super-agenda-mode nil)
 '(org-tags-column 0)
 '(org-tree-slide-skip-done nil)
 '(org-tree-slide-skip-outline-level 4)
 '(package-selected-packages
   (quote
    (no-littering yequake org-popnote ivy all-the-icons posframe shrink-path quelpa-use-package quelpa eslintd-fix ns-auto-titlebar edit-indirect edit-indiect highlight-indent-guides forge persp counsel-jq lua-mode prism git-gutter-fring git-gutter-fringe+ git-gutter-fr git-gutter-fringe git-gutter scratch ivy-rich avy org-contacts org-make-toc org-habit slime-docker dired-git-info persp-mode perspective org-tree-slide helm-c-yasnippet yasnippet-snippets helm-org toc-org org-sticky-header solaire-mode eshell-up magithub xterm-color eshell-toggle ob-restclient system-package grip-mode ivy-taskrunner helm-taskrunner taskrunner bang linum-relative rg use-package-ensure-system-package unfill auto-package-update goto-line-preview vterm helm-org-rifle counsel-projectile counsel org-super-agenda hackernews shackle helm-flyspell doom-modeline dired-quick-sort company-box osx-trash org-protocol org-bullets esh-autosuggest py-autopep8 elpy restart-emacs typescript deadgrep ripgrep helm-man parrot dashboard transmission helm-rg tuareg merlin reason-mode company-tern tern all-the-icons-dired diredfl dired true command-log-mode symbol-overlay dimmer org-gcal pcmpl-args pcmpl-git pcmpl-homebrew flyspell-popup org-plus-contrib doom-themes darktooth-theme select-themes moe-theme htmlize magit helpful atomic-chrome srcery-theme spaceline-all-the-icons abbrev-mode python-mode abbrev spaceline-config dotenv-mode auctex nlinum-hl prettier-js-mode nlinum dired-du restclient-helm helm-spotify-plus alert copy-as-format highlight-symbol flycheck-flow dimmer-mode dimemr zoom projectile-ripgrep indium flow-minor-mode auto-minor-mode helm-core prettier-js tide rjsx-mode company-flow neotree string-inflection color-theme-sanityinc-tomorrow wttrin wolfram dracula-theme golint expand-region dockerfile-mode better-defaults paradox nginx-mode web-mode move-text zoom-frm zoom-window ujelly-theme cyberpunk-theme darkokai-theme helm-flycheck helm-descbinds golden-ratio cask-mode keyfreq which-key helm-ag company-flx vagrant-tramp puppet-mode nodejs-repl system-packages dash-at-point ## fancy-battery rainbow-mode elm-mode elm-yasnippets scss-mode react-snippets js2-refactor flycheck-css-colorguard flycheck-elm flycheck-typescript-tslint company-go go-mode anzu eyebrowse spaceline editorconfig yasnippet company-web company-jedi yaml-mode company afternoon-theme pdf-tools helm-package async helm-ack helm-chrome helm-gitignore helm-google helm-projectile helm projectile markdown-mode exec-path-from-shell flycheck use-package multiple-cursors monokai-theme php-mode json-mode js2-mode imenu+ bubbleberry-theme 2048-game)))
 '(paradox-automatically-star nil)
 '(paradox-column-width-package 22)
 '(paradox-display-download-count t)
 '(paradox-display-star-count t)
 '(paradox-execute-asynchronously t)
 '(paradox-github-token nil)
 '(pdf-view-midnight-colors (quote ("#FDF4C1" . "#282828")))
 '(persp-keymap-prefix "P")
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(posframe-inhibit-double-buffering t)
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-switch-project-action (quote projectile-dired))
 '(python-shell-interpreter "python3")
 '(rg-use-transient-menu t)
 '(right-fringe-width 0 t)
 '(safe-local-variable-values (quote ((eval progn (pp-buffer) (indent-buffer)))))
 '(search-default-mode (quote char-fold-to-regexp))
 '(shackle-default-rule (quote (:select nil)))
 '(shackle-rules
   (quote
    (("*helm-ag*" :select t :align right :size 0.5)
     ("*helm semantic/imenu*" :select t :align right :size 0.4)
     ("*helm org inbuffer*" :select t :align right :size 0.4)
     ("*eshell*" :select t :inhibit-window-quit t :other t)
     (magit-status-mode :select t :align right :inhibit-window-quit t :other t)
     (magit-log-mode :select t :inhibit-window-quit t :other t)
     (magit-log-select-mode :select t :inhibit-window-quit t :other t)
     (magit-diff-mode :select nil :inhibit-window-quit t :other t)
     (magit-stash-mode :select nil :inhibit-window-quit t :other t)
     (magit-revision-mode :select t :inhibit-window-quit t :other t)
     (flycheck-error-list-mode :select nil :inhibit-window-quit t :align below :size 0.25)
     (compilation-mode :select nil :align below :size 0.25)
     (messages-buffer-mode :select t :align below :size 0.25)
     (inferior-emacs-lisp-mode :select t :align below :size 0.25)
     (calendar-mode :select t :align below :size 0.25)
     (help-mode :select t :align right :size 0.5)
     (helpful-mode :select t :align right :size 0.5)
     ("*rg*" :select t :inhibit-window-quit t :other t)
     (" *Deletions*" :select t :align below :size 0.25)
     (" *Marked Files*" :select t :align below :size 0.25)
     ("*Org Select*" :same t)
     ("*Org Note*" :select t :align below :size 0.33)
     ("*Org Links*" :select t :align below :size 0.2)
     (" *Org todo*" :select t :align below :size 0.2)
     ("*Man.*" :select t :align below :size 0.5 :regexp t)
     ("*helm.*" :select t :align below :size 0.33 :regexp t)
     ("*Org Src.*" :select t :align right :size 0.5 :regexp t))))
 '(tramp-default-method "ssh")
 '(tramp-default-proxies-alist nil)
 '(tramp-save-ad-hoc-proxies t)
 '(typescript-enabled-frameworks (quote (typescript)))
 '(typescript-indent-level 2)
 '(vc-annotate-background "#1c1e1f")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b6e63e")
    (cons 40 "#c4db4e")
    (cons 60 "#d3d15f")
    (cons 80 "#e2c770")
    (cons 100 "#ebb755")
    (cons 120 "#f3a73a")
    (cons 140 "#fd971f")
    (cons 160 "#fc723b")
    (cons 180 "#fb4d57")
    (cons 200 "#fb2874")
    (cons 220 "#f43461")
    (cons 240 "#ed404e")
    (cons 260 "#e74c3c")
    (cons 280 "#c14d41")
    (cons 300 "#9c4f48")
    (cons 320 "#77504e")
    (cons 340 "#555556")
    (cons 360 "#555556")))
 '(vc-annotate-very-old-color nil)
 '(vc-handled-backends nil)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-indentation nil)
 '(which-key-popup-type (quote side-window))
 '(which-key-side-window-location (quote bottom))
 '(which-key-side-window-max-height 0.25)
 '(which-key-side-window-max-width 0.33)
 '(yaml-indent-offset 4)
 '(zoom-ignored-buffer-names (quote ("*which-key*")))
 '(zoom-ignored-major-modes (quote (ranger-mode neotree-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
<<<<<<< HEAD
 '(default ((t (:inherit nil :stipple nil :background "#1c1e1f" :foreground "#d6d6d4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Inconsolata"))))
 '(diredfl-date-time ((t (:inherit default :foreground "#66d9ef" :weight light))))
 '(org-ellipsis ((t (:foreground "gray40" :underline nil))))
 '(web-mode-css-variable-face ((t (:inherit web-mode-variable-name-face)))))
=======
 '(org-ellipsis ((t (:foreground "gray40" :underline nil)))))
>>>>>>> 20200216
