{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      # Build tools
      pkg-config
      gcc
      cmake
      gnumake
      ninja

      unzip
      wget
      wl-clipboard
      nodePackages.cspell

      tree-sitter
      languagetool-rust

      # Node
      nodejs
      nodePackages.npm
      nodePackages.typescript

      # Lua
      lua5_4_compat
      lua54Packages.luarocks
      stylua

      # PHP
      php82
      php82Packages.composer
      php82Packages.phpstan

      # Python
      black
      ruff

      # Rust
      cargo
      rustc

      # Go
      go
      gofumpt
      golines
      goimports-reviser

      # Nix
      deadnix
      nixfmt
      statix
    ];
  };

  # Set default editor to be nvim
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
    SUDO_EDITOR = "${pkgs.neovim}/bin/nvim";
  };
}
