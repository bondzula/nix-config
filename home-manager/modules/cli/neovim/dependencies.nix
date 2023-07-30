{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tree-sitter

    # Node
    nodejs
    nodePackages.npm
    nodePackages.typescript

    # PHP
    php82
    php82Packages.composer
    php82Packages.phpstan

    # Rust
    rustup
    cargo

    # Lua
    lua

    # Nix
    deadnix
    nixfmt
    statix
  ];
}
