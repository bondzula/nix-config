{ pkgs, ... }:

let 
  customNodePackages = pkgs.callPackage ./customNodePackages {  };
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
      php82
      php82Packages.composer
      php82Packages.phpstan

      # Nix
      deadnix
      nixfmt
      statix

      # LSP's
      ansible-language-server
      gopls
      lua-language-server
      marksman
      nil
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.eslint_d
      nodePackages.intelephense
      nodePackages.pyright
      nodePackages.stylelint
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-html-languageserver-bin
      nodePackages.vscode-json-languageserver
      nodePackages.yaml-language-server
      rust-analyzer
      sqls
      terraform-ls

      # LSP's with custom node packages
      customNodePackages."@astrojs/language-server"
      customNodePackages."emmet-ls"
      customNodePackages."stylelint-lsp"
      customNodePackages."@tailwindcss/language-server"
      customNodePackages."@volar/vue-language-server"
      customNodePackages."vscode-langservers-extracted" # eslint-ls
    ];
  };
}
