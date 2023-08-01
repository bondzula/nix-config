{ pkgs, ... }:

# CLI Packages used on every system
{
  import = [
    ./atuin.nix
    ./bat.nix
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
    difftastic # Modern Unix `diff`
    dua # Modern Unix `du`
    duf # Modern Unix `df`
    du-dust # Modern Unix `du`
    fd # Modern Unix `find`
    glow # Terminal Markdown renderer
    gping # Modern Unix `ping`
    hyperfine # Terminal benchmarking
    moar # Modern Unix `less`
    neofetch # Terminal system info
    procs # Modern Unix `ps`
    tldr # Modern Unix `man`
    tokei # Modern Unix `wc` for code
    curl
    httpie # Modern curl
    wget
    unzip
    trash-cli
  ];
}
