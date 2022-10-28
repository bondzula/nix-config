{ config, pkgs, ... }:

{
  # Setup the GitHub cli tool
  # https://cli.github.com/manual/
  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
      git_protocol = "ssh";
    };
  };
}