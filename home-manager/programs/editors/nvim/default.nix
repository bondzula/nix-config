{ config, pkgs, lib, ... }:

let
  sources = pkgs.callPackage _sources/generated.nix { };

  generatedPluginSources = with lib;
    mapAttrs'
      (n:
        nameValuePair
          (removePrefix "'plugin-" (removeSuffix "'" n)))
      (filterAttrs (n: _: hasPrefix "'plugin-" n)
        sources);

  buildPlugin = source:
    pkgs.vimUtils.buildVimPluginFrom2Nix {
      inherit (source) pname version src;
    };

  generatedPlugins = with lib;
    mapAttrs (_: buildPlugin) generatedPluginSources;


  plugins =
    generatedPlugins
    // {
      # Use nvim-treesitter plugins from nixpkgs so
      # Treesitter queries are synced with libraries
    };
in
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

      # Go
      go

      lua

      # Rust
      cargo

      # PHP
      php
      php81Packages.composer
      php81Packages.phpstan

      # Telescope Dependencies
      ripgrep
      fd
      fzf
    ];
  };

  # xdg.configFile."nvim/init.lua".source = ./init.lua;
  # xdg.configFile."nvim/lua" = {
  #   recursive = true;
  #   source = ./lua;
  # };

  # xdg.dataFile =
  #   {
  #     "nvim/vscode-lldb" = {
  #       source = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb";
  #       recursive = true;
  #     };
  #   }
  #   // (with lib;
  #   mapAttrs'
  #     (n: v:
  #       nameValuePair "nvim/plugins/${n}" {
  #         source = "${v}";
  #       })
  #     plugins);
}
