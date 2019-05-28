((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick
  ("--ff"))
 (magit-commit nil
               ("--reset-author"))
 (magit-diff nil
             ("--no-ext-diff" "--stat"))
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
 (magit-push
  ("--force-with-lease")
  nil)
 (magit-rebase nil
               ("--autosquash")
               ("--autosquash" "--interactive")
               ("--autostash" "--interactive")
               ("--interactive"))
 (magit-remote
  ("-f"))
 (magit-reset nil)
 (magit-run nil)
 (magit-stash nil)
 (magit-submodule nil)
 (magit-worktree nil))
