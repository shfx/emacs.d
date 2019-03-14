((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-commit nil
               ("--reset-author"))
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-fetch nil
              ("--prune"))
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--color" "--decorate")
  ("-n256" "--graph" "--decorate"))
 (magit-log-refresh
  ("-n256" "--graph" "--decorate")
  ("-n256" "--decorate"))
 (magit-pull nil)
 (magit-push nil)
 (magit-rebase
  ("--autosquash" "--interactive")
  ("--autostash" "--interactive")
  ("--interactive"))
 (magit-reset nil)
 (magit-run nil)
 (magit-submodule nil))
