{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    extraPackages = with pkgs; [
      tree-sitter
      # General
      wl-clipboard
      xclip

      # JavaScript
      nodePackages.typescript
      deno
      nodePackages.cspell
      nodejs
      nodePackages.npm

      # Go
      go

      lua

      # PHP
      php
      php81Packages.composer
      php81Packages.phpstan
    ];
  };
}
