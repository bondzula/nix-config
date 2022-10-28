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

    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (plugins: [
        plugins.tree-sitter-c
        plugins.tree-sitter-go
        plugins.tree-sitter-vue
        plugins.tree-sitter-vim
        plugins.tree-sitter-tsx
        plugins.tree-sitter-php
        plugins.tree-sitter-lua
        plugins.tree-sitter-hcl
        plugins.tree-sitter-css
        plugins.tree-sitter-cpp
        plugins.tree-sitter-yaml
        plugins.tree-sitter-toml
        plugins.tree-sitter-rust
        plugins.tree-sitter-scss
        plugins.tree-sitter-json
        plugins.tree-sitter-html
        plugins.tree-sitter-bash
        plugins.tree-sitter-latex
        plugins.tree-sitter-jsdoc
        plugins.tree-sitter-prisma
        plugins.tree-sitter-haskell
        plugins.tree-sitter-graphql
        plugins.tree-sitter-markdown
        plugins.tree-sitter-typescript
        plugins.tree-sitter-javascript
        plugins.tree-sitter-nix
        plugins.tree-sitter-query
      ]))
      nvim-treesitter-textobjects
      nvim-treesitter-refactor
    ];

    extraPackages = with pkgs; [
      # General
      wl-clipboard
      gcc
      tree-sitter

      # Lua
      sumneko-lua-language-server
      selene

      # Nix
      statix
      rnix-lsp

      # JavaScript
      nodePackages.prettier
      nodePackages.eslint
      nodePackages.typescript

      # Go
      go
      gopls

      # Rust
      cargo

      # PHP
      php
      php81Packages.composer
      php81Packages.phpstan
      nodePackages.intelephense

      # Shell
      shfmt
      nodePackages.bash-language-server

      # YAML
      yamllint
      ansible-lint
      nodePackages.yaml-language-server

      # Markdown
      vale
      ltex-ls

      # Terraform
      terraform-ls

      # Telescope Dependencies
      ripgrep
      fd
      fzf
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./init.lua;
  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };

  xdg.dataFile =
    {
      "nvim/vscode-lldb" = {
        source = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb";
        recursive = true;
      };
    }
    // (with lib;
    mapAttrs'
      (n: v:
        nameValuePair "nvim/plugins/${n}" {
          source = "${v}";
        })
      plugins);
}
