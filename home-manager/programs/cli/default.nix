{ pkgs, ... }: {

  imports = [
    ./bat
    ./lf
    ./tmux
    ./zsh.nix
    ./btop.nix
    ./exa.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./mpv.nix
    ./starship.nix
    ./yt-dlp.nix
    ./zoxide.nix
    ./direnv.nix
    ./ripgrep.nix
    ./fd.nix
    ./playerctl.nix
    ./firefox.nix
    ./ssh.nix
    ./gnupg.nix
  ];

  home.packages = with pkgs; [
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
