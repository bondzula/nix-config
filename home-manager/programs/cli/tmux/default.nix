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
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];
  };

  xdg.configFile."tmux/extra.conf".source = ./tmux.conf;
}
