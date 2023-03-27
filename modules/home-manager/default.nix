# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{ inputs, pkgs, ... }:

{
  home = {
    username = "bondzula";
    homeDirectory = "/home/bondzula";
  };

  # Font config
  fonts.fontconfig.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";

  imports = [
    ./alacritty.nix
    ./bat
    ./btop.nix
    ./chromium.nix
    ./direnv.nix
    ./exa.nix
    ./fd.nix
    ./firefox.nix
    ./foot.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./gnupg.nix
    ./hyprland.nix
    ./kdeconnect.nix
    ./lazygit.nix
    ./lf
    ./mako.nix
    ./mpv.nix
    ./nvim.nix
    ./playerctl.nix
    ./ripgrep.nix
    ./scripts
    ./ssh.nix
    ./starship.nix
    ./swaylock.nix
    ./wallpapers
    ./waybar.nix
    ./wofi
    ./tmux.nix
    ./yt-dlp.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })

    _1password-gui
    obsidian
    obs-studio
    skypeforlinux
    signal-desktop
    discord
    brave
    google-chrome
    thunderbird
    gimp
    keepassxc
    wezterm

    wl-clipboard

    mysql80
    curl
    wget
    unzip
    ffmpeg
    imagemagick
    terraform
    awscli
    ssm-session-manager-plugin
    nix-prefetch-github
    gcc
    bc
    httpie
    jq
    trash-cli
    cargo
    rustc
    nodejs
    nodePackages.pnpm
    gnumake
    libsForQt5.index
    # lua
    openssl
    pkgconfig
    libiconv

    cachix
    inputs.devenv.packages.x86_64-linux.devenv
    node2nix
  ];
}
