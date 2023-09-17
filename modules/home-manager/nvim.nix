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
      nodePackages.eslint_d
      prettierd

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
      gopls
      gofumpt
      golines
      goimports-reviser

      # Nix
      nil
      deadnix
      nixfmt
      statix

      # Shell
      shfmt

      nodePackages.dockerfile-language-server-nodejs
      nodePackages.bash-language-server
      nodePackages.intelephense
      nodePackages.vscode-langservers-extracted
      nodePackages.jsonlint
      lua-language-server
      marksman
      python311Packages.python-lsp-server
      rust-analyzer
      nodePackages.svelte-language-server
      nodePackages."@tailwindcss/language-server"
      terraform-ls
      nodePackages.volar
    ];
  };

  # Set default editor to be nvim
  home.sessionVariables = {
    EDITOR = "${pkgs.neovim}/bin/nvim";
    VISUAL = "${pkgs.neovim}/bin/nvim";
    SUDO_EDITOR = "${pkgs.neovim}/bin/nvim";
  };
}
