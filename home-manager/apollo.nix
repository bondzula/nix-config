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
    outputs.hmModules.chromium
    outputs.hmModules.direnv
    outputs.hmModules.exa
    outputs.hmModules.fd
    outputs.hmModules.firefox
    outputs.hmModules.fonts
    outputs.hmModules.foot
    outputs.hmModules.fzf
    outputs.hmModules.gh
    outputs.hmModules.git
    outputs.hmModules.gnupg
    outputs.hmModules.nvim
    outputs.hmModules.ripgrep
    outputs.hmModules.ssh
    outputs.hmModules.starship
    outputs.hmModules.yt-dlp
    outputs.hmModules.zellij
    outputs.hmModules.zoxide
    outputs.hmModules.zsh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    bc
    curl
    wget
    unzip
    imagemagick
    terraform # TODO: Move to project specific
    awscli2
    ssm-session-manager-plugin
    httpie
    jq
    trash-cli
    nodePackages.pnpm
    gnumake
    gcc
    flyctl # TODO: Move to project specific
    supabase-cli # TODO: Move to project specific
    bitwarden
    logseq
  ];

  # Set default browser
  home.sessionVariables = {
    BROWSER = "chromium";
  };
}
