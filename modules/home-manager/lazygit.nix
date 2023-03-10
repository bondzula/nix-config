{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        # stuff relating to the UI
        showIcons = true;
        scrollHeight = 2; # how many lines you scroll by
        scrollPastBottom = true; # enable scrolling past the bottom
        sidePanelWidth = 0.3333; # number from 0 to 1
        expandFocusedSidePanel = false;
        mainPanelSplitMode =
          "flexible"; # one of 'horizontal' | 'flexible' | 'vertical'
        language = "auto"; # one of 'auto' | 'en' | 'zh' | 'pl' | 'nl'
        theme = {
          lightTheme = false; # For terminals with a light background
          activeBorderColor = [ "magenta" "bold" ];
          inactiveBorderColor = [ "black" ];
          optionsTextColor = [ "black" ];
          selectedLineBgColor = [ "black" ];
          selectedRangeBgColor = [ "yellow" ];
          cherryPickedCommitBgColor = [ "blue" ];
          cherryPickedCommitFgColor = [ "cyan" ];
          unstagedChangesColor = [ "white" ];
        };
        commitLength = { show = true; };
        mouseEvents = true;
        skipUnstageLineWarning = false;
        skipStashWarning = true;
        showFileTree = true; # for rendering changes files in a tree format
        showListFooter =
          false; # for seeing the '5 of 20' message in list panels
        showRandomTip = true;
        showCommandLog = false;
        showBottomLine = false;
        commandLogSize = 8;
      };
      git = {
        paging = {
          colorArg = "always";
          useConfig = false;
        };
        # pager: delta --dark --color-only --side-by-side
        merging = {
          # only applicable to unix users
          manualCommit = false;
          # extra args passed to `git merge`, e.g. --no-ff
          args = "";
        };
        skipHookPrefix = "WIP";
        autoFetch = true;
        autoRefresh = true;
        branchLogCmd =
          "git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}} --";
        allBranchesLogCmd =
          "git log --graph --all --color=always --abbrev-commit --decorate --date=relative  --pretty=medium";
        overrideGpg =
          false; # prevents lazygit from spawning a separate process when using GPG
        disableForcePushing = true;
        parseEmoji = true;
        log = {
          # one of date-order, author-date-order, topo-order.
          # topo-order makes it easier to read the git log graph, but commits may not
          # appear chronologically. See https://git-scm.com/docs/git-log#_commit_ordering
          order = "topo-order";
          # one of always, never, when-maximised
          # this determines whether the git graph is rendered in the commits panel
          showGraph = "always";
          # displays the whole git graph by default in the commits panel (equivalent to passing the `--all` argument to `git log`)
          showWholeGraph = true;
        };
      };
      os = {
        editCommand = ""; # see 'Configuring File Editing' section
        editCommandTemplate = "{{editor}} +{{line}} -- {{filename}}";
        openCommand = "";
      };
      refresher = {
        refreshInterval = 10; # file/submodule refresh interval in seconds
        fetchInterval = 60; # re-fetch interval in seconds
      };
      update = {
        method = "prompt"; # can be: prompt | background | never
        days = 14; # how often an update is checked for
      };
      reporting = "on"; # one of: 'on' | 'off' | 'undetermined'
      confirmOnQuit = false;
      # determines whether hitting 'esc' will quit the application when there is nothing to cancel/close
      quitOnTopLevelReturn = true;
      disableStartupPopups = false;
      notARepository = "skip"; # one of: 'prompt' | 'create' | 'skip'
      promptToReturnFromSubprocess =
        false; # display confirmation when subprocess terminates
    };
  };
}
