((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick nil
                    ("--ff"))
 (magit-commit
  ("--no-verify")
  nil
  ("--author=Marcin Wiśniowski <shfx@shfx.pl>")
  ("--reset-author"))
 (magit-diff
  ("--no-ext-diff" "--stat")
  nil)
 (magit-dispatch nil)
 (magit-fetch nil
              ("--prune"))
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256" "--graph" "--color" "--decorate"))
 (magit-log-refresh
  ("-n256" "--graph" "--decorate")
  ("-n256" "--decorate"))
 (magit-merge nil)
 (magit-pull nil
             ("--rebase"))
 (magit-push nil
             ("--force-with-lease"))
 (magit-rebase nil
               ("--autosquash")
               ("--autosquash" "--interactive")
               ("--autostash" "--interactive")
               ("--interactive"))
 (magit-reset nil)
 (magit-run nil)
 (magit-stash nil)
 (magit-submodule nil)
 (magit:--author "Marcin Wiśniowski <shfx@shfx.pl>"))
