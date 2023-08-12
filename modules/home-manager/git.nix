{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Stefan Bondzulic";
    userEmail = "stefanbondzulic@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      featch.prune = true;
      pull.rebase = true;
      merge.conflictstyle = "diff3";
      diff.external = "difft";
    };
  };

  # Enable GitHub CLI as well
  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
      git_protocol = "ssh";
    };
  };

  home.packages = with pkgs; [
    difftastic
  ];
}
