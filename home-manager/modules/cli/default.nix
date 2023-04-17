{ pkgs, ... }:

{
  imports = [
    ./bat
    ./btop.nix
    ./direnv.nix
    ./exa.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./gnupg.nix
    ./lazygit.nix
    ./lf
    ./nvim.nix
    ./ripgrep.nix
    ./scripts
    ./ssh.nix
    ./starship.nix
    ./tmux.nix
    ./yt-dlp.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt
    mysql80
    bc
    curl
    wget
    unzip
    ffmpeg
    imagemagick
    terraform
    awscli
    ssm-session-manager-plugin
    httpie
    jq
    trash-cli
    cargo
    rustc
    nodejs
    nodePackages.pnpm
    gnumake
    gcc

    # Required for VS Code SSH
    vscode
  ];
}
