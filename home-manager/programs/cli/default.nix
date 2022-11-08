{ pkgs, ... }: {

  imports = [
    ./bat
    ./lf
    ./tmux
    ./zsh
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
  ];

  home.packages = with pkgs; [
    curl
    wget
    unzip
    ffmpeg
    imagemagick
    fd
    ripgrep
    terraform
    awscli
    nix-prefetch-github
    lazygit
    gcc
    bc
    httpie
    jq
    silicon
  ];
}
