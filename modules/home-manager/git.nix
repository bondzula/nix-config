{ pkgs, ... }:
{
  home.packages = with pkgs; [
    difftastic
    delta
  ];

  programs.git = {
    enable = true;
    userName = "Stefan Bondzulic";
    userEmail = "stefanbondzulic@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";

      # Difftastic
      diff.external = "difft";
    };
  };
}
