{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      hwdec = "auto";
      cursor-autohide = 1000;
      save-position-on-quit = true;

      # Audio
      volume = 60;
      af-add = "dynaudnorm=g=5:f=250:r=0.9:p=0.5";

      # Subtitles
      blend-subtitles = true;

      ytdl-format = "bestvideo[height<=?1440][fps<=?60][vcodec!=?vp9]+bestaudio/best";
    };
  };
}