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

      # Rust
      cargo
      rustup

      # Go
      go
      gofumpt
      golines

      # Nix
      deadnix
      nixfmt
      statix
    ];
  };

  # Set default editor to be nvim
  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "/home/bondzula/.nix-profile/bin/nvim";
  };
}
