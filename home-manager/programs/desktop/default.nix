{ pkgs, ... }:

{
  home.packages = with pkgs; [
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
  ];

  imports = [
    ./kdeconnect.nix
    ./foot.nix
    ./flameshot.nix
    ./chromium.nix
  ];
}
