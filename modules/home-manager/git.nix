{ config, pkgs, libs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Stefan Bondzulic";
    userEmail = "stefanbondzulic@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      core.pager = "delta";

      # Delta config
      delta.side-by-side = true;
      delta.line-numbers = false;
    };
  };
}
