{ pkgs, ... }:

{
  imports = [
    ./chromium.nix
    ./kdeconnect.nix
    ./mpv.nix
    ./playerctl.nix
    ./yt-dlp.nix
    ./wezterm
  ];

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })

    bitwarden
    brave
    firefox
    google-chrome
    keepassxc
    obsidian
    obs-studio
    signal-desktop
    wl-clipboard
  ];
}
