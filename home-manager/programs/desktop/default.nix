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
    firefox
    thunderbird
    gimp
    keepassxc
  ];

  imports = [
    ./kdeconnect.nix
    ./foot.nix
    ./flameshot.nix
    ./chromium.nix
  ];
}
