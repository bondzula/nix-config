{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = [
      pkgs.vscode-extensions.bbenoist.nix
      pkgs.vscode-extensions.vscodevim.vim
      pkgs.vscode-extensions.eamodio.gitlens
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.minimap.enabled" = false;
      "window.menuBarVisibility" = "toggle";
      "vim.useSystemClipboard" = true;
    };
  };
}
