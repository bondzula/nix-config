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
    ./zellij
    ./zoxide.nix
    ./zsh.nix
    # ./php.nix
    ../desktop/wezterm
  ];

  home.packages = with pkgs; [
    zf
    zellij
    atuin
    mlocate
    wl-clipboard
    # mysql80
    bc
    curl
    wget
    unzip
    imagemagick
    terraform
    awscli2
    ssm-session-manager-plugin
    httpie
    jq
    trash-cli
    nodePackages.pnpm
    gnumake
    gcc

    flyctl
    supabase-cli
  ];
}
