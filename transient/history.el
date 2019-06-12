((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick
  ("--ff")
  nil)
 (magit-commit nil
               ("--no-verify")
               ("--author=Marcin Wiśniowski <shfx@shfx.pl>")
               ("--reset-author"))
 (magit-diff
  ("--ignore-space-change" "--ignore-all-space")
  ("--ignore-space-change" "--ignore-all-space" "--no-ext-diff" "--stat")
  ("--ignore-all-space" "--no-ext-diff" "--stat")
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-ediff nil)
 (magit-fetch
  ("--prune"))
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256" "--author=Marcin Wisniowski <mwisniowski@opera.com>" "--graph" "--decorate")
  ("-n256" "--author=Marcin Wisniowski <mwisniowski@opera.com>" "--graph" "--color" "--decorate")
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
               ("--autostash")
               ("--autosquash" "--interactive")
               ("--autostash" "--interactive")
               ("--interactive"))
 (magit-reset nil)
 (magit-run nil)
 (magit-stash nil)
 (magit-submodule nil)
 (magit-tag nil)
 (magit-worktree nil)
 (magit:--author "Marcin Wisniowski <mwisniowski@opera.com>" "Marcin Wiśniowski <shfx@shfx.pl>"))
