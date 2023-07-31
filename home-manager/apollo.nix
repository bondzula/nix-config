{ pkgs, ... }:

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
    ./modules/cli/atuin.nix
    ./modules/cli/bat
    ./modules/cli/btop.nix
    ./modules/cli/direnv.nix
    ./modules/cli/exa.nix
    ./modules/cli/fd.nix
    ./modules/cli/fzf.nix
    ./modules/cli/gh.nix
    ./modules/cli/git.nix
    ./modules/cli/gnupg.nix
    ./modules/cli/nvim.nix
    ./modules/cli/ripgrep.nix
    ./modules/cli/ssh.nix
    ./modules/cli/starship.nix
    ./modules/cli/yt-dlp.nix
    ./modules/cli/zellij
    ./modules/cli/zoxide.nix
    ./modules/cli/zsh.nix

    ./modules/desktop/default.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
