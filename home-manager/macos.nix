{ pkgs, outputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "stefanbondzulic";
  home.homeDirectory = "/Users/stefanbondzulic";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not changeg this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11";

  # Import existing modules
  imports = [
    outputs.hmModules.console
    outputs.hmModules.wezterm
    outputs.hmModules.php
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    discord
    fnm
    raycast
    obsidian
  ];
}