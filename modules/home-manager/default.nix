# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{ pkgs, ... }: 

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
    ./nvim.nix
    ./bat
    ./btop.nix
    ./chromium.nix
    ./exa.nix
    ./fd.nix
    ./firefox.nix
    ./flameshot.nix
    ./foot.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./gnupg.nix
    ./kdeconnect.nix
    ./lf
    ./mpv.nix
    ./playerctl.nix
    ./ripgrep.nix
    ./ssh.nix
    ./starship.nix
    ./tmux
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
    alacritty
    qbittorrent

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
    lazygit
    delta
    gcc
    bc
    httpie
    jq
    trash-cli
    cargo
    rustc
    fnm
    nodePackages.pnpm
    gnumake
    libsForQt5.index
    # lua
    openssl
    pkgconfig
    libiconv

    # nix helpers
    nixfmt
    deadnix
    statix
  ];
}
