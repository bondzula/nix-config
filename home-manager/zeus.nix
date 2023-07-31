{ pkgs, outputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bondzula";
  home.homeDirectory = "/home/bondzula";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05";

  imports = [
    outputs.hmModules.atuin
    outputs.hmModules.bat
    outputs.hmModules.btop
    outputs.hmModules.direnv
    outputs.hmModules.exa
    outputs.hmModules.fd
    outputs.hmModules.fzf
    outputs.hmModules.gh
    outputs.hmModules.git
    outputs.hmModules.gnupg
    outputs.hmModules.lazygit
    outputs.hmModules.lf
    outputs.hmModules.nvim
    outputs.hmModules.php
    outputs.hmModules.ripgrep
    outputs.hmModules.ssh
    outputs.hmModules.starship
    outputs.hmModules.tmux
    outputs.hmModules.yt-dlp
    outputs.hmModules.zellij
    outputs.hmModules.zoxide
    outputs.hmModules.zsh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
