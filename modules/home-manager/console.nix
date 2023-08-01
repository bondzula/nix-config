{ pkgs, ... }:

# CLI Packages used on every system
{
  imports = [
    ./atuin.nix
    ./bat
    ./btop.nix
    ./direnv.nix
    ./exa.nix
    ./fd.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./nvim.nix
    ./ripgrep.nix
    ./ssh.nix
    ./starship.nix
    ./zellij
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    asciinema # Terminal recorder
    curl
    difftastic # Modern Unix `diff`
    dua # Modern Unix `du`
    du-dust # Modern Unix `du`
    duf # Modern Unix `df`
    fd # Modern Unix `find`
    glow # Terminal Markdown renderer
    gping # Modern Unix `ping`
    httpie # Modern curl
    hyperfine # Terminal benchmarking
    magic-wormhole
    moar # Modern Unix `less`
    neofetch # Terminal system info
    procs # Modern Unix `ps`
    tldr # Modern Unix `man`
    tokei # Modern Unix `wc` for code
    trash-cli
    unzip
    wget
  ];
}

