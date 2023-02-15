{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 50;
    prefix = "'C-\\'";
    aggressiveResize = true;
    historyLimit = 5000;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    extraConfig = "source-file ~/.config/tmux/extra.conf";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.tmux-fzf;
        extraConfig = "set -g @plugin 'sainnhe/tmux-fzf'";
      }
    ];
  };

  xdg.configFile."tmux/extra.conf".source = ./tmux.conf;
}
