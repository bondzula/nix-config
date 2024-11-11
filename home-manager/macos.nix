{ pkgs, outputs, ... }:

{
  home = {
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    username = "stefanbondzulic";
    homeDirectory = "/Users/stefanbondzulic";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not changeg this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11";

    packages = with pkgs; [
      fnm
      mariadb
      awscli2
      terraform
      jq
      ssm-session-manager-plugin
      lazygit
      go
      air
      cachix
    ];
  };

  # Import existing modules
  imports = [
    outputs.hmModules.console
    outputs.hmModules.wezterm
    outputs.hmModules.php
    outputs.hmModules.tmux
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
