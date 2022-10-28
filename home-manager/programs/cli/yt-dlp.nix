{ config, pkgs, ... }:

{
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-thumbnail = true;
      embed-subs = true;
      sub-langs = "English";
    };
  };
}
