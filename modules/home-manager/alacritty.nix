{
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;

      env.TERM = "xterm-256color";

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };
        size = 14.0;
      };

      window = {
        opacity = 0.8;
        padding = {
          x = 14;
          y = 10;
        };
        dynamic_padding = false;
        decorations = "none";
      };

      # NOTE: helpful hex codes
      # \x1b = escape (useful for vim-related keybindings)
      # \x02 = control-b (the default tmux prefix)
      key_bindings = [
        # select tmux window 1
        {
          key = "Key1";
          mods = "Alt";
          chars = "\\x021";
        }
        {
          key = "Key2";
          mods = "Alt";
          chars = "\\x022";
        }
        {
          key = "Key3";
          mods = "Alt";
          chars = "\\x023";
        }
        {
          key = "Key4";
          mods = "Alt";
          chars = "\\x024";
        }
        {
          key = "Key5";
          mods = "Alt";
          chars = "\\x025";
        }
        {
          key = "Key6";
          mods = "Alt";
          chars = "\\x026";
        }
        {
          key = "Key7";
          mods = "Alt";
          chars = "\\x027";
        }
        {
          key = "Key8";
          mods = "Alt";
          chars = "\\x028";
        }
        {
          key = "Key9";
          mods = "Alt";
          chars = "\\x029";
        }

        # rename the current tmux window
        {
          key = "Comma";
          mods = "Alt";
          chars = "\\x02,";
        }
        # split tmux window vertically
        {
          key = "V";
          mods = "Alt";
          chars = ''\x02"'';
        }
        # split tmux window horizontally
        {
          key = "S";
          mods = "Alt|Shift";
          chars = "\\x02%";
        }
        # start tmux search mode
        {
          key = "F";
          mods = "Alt|Shift";
          chars = "\\x02\\x5b\\x2f";
        }
        # open git manager 'jesseduffield/lazygit'
        {
          key = "G";
          mods = "Alt";
          chars = "\\x02g";
        }
        # open t - tmux smart session manager
        {
          key = "J";
          mods = "Alt";
          chars = "\\x02t";
        }
        # open interactive tmux session client
        {
          key = "K";
          mods = "Alt";
          chars = "\\x02s";
        }
        # switch to the last tmux session
        {
          key = "L";
          mods = "Alt";
          chars = "\\x02L";
        }
        {
          key = "O";
          mods = "Alt";
          chars = "\\x02u";
        }
        # enter the tmux command prompt
        {
          key = "Semicolon";
          mods = "Alt";
          chars = "\\x02:";
        }
        # create a new tmux window
        {
          key = "T";
          mods = "Alt";
          chars = "\\x02c";
        }
        # kill the current pane
        {
          key = "W";
          mods = "Alt";
          chars = "\\x02x";
        }
        # toggle zoom state of the current tmux pane
        {
          key = "Z";
          mods = "Alt";
          chars = "\\x02z";
        }
      ];
    };
  };
}
