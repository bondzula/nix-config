{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "'C-\\'";
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
