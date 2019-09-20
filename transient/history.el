((magit-am
  ("--3way"))
 (magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-cherry-pick nil)
 (magit-commit nil
               ("--no-verify")
               ("--author=Marcin Wiśniowski <shfx@shfx.pl>")
               ("--reset-author"))
 (magit-diff
  ("--ignore-all-space" "--no-ext-diff" "--stat")
  ("--no-ext-diff" "--stat")
  ("--ignore-space-change" "--ignore-all-space" "--no-ext-diff" "--stat")
  ("--ignore-space-change" "--ignore-all-space"))
 (magit-dispatch nil)
 (magit-ediff nil)
 (magit-fetch
  ("--prune")
  nil)
 (magit-gitignore nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  ("-n256" "--decorate")
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
             ("--force-with-lease")
             ("--no-verify"))
 (magit-rebase nil
               ("--autosquash")
               ("--autostash")
               ("--autosquash" "--interactive")
               ("--autostash" "--interactive")
               ("--interactive"))
 (magit-remote
  ("-f"))
 (magit-reset nil)
 (magit-run nil)
 (magit-stash nil)
 (magit-submodule nil)
 (magit-tag nil)
 (magit-worktree nil)
 (magit:--author "Marcin Wisniowski <mwisniowski@opera.com>" "Marcin Wiśniowski <shfx@shfx.pl>")
 (magithub-dispatch-popup nil))
