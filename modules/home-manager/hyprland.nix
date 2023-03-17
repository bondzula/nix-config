{ inputs, pkgs, ... }:

{
  imports = [ inputs.hyprland.homeManagerModules.default ];

  home.packages = with pkgs;[
    wlr-randr
    swww

    wofi
    wlogout
    wlogout
    grim
    slurp
    wf-recorder
    glib
    wayland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
    extraConfig = ''
      $mainMod = SUPER
      monitor=eDP-2,2560x1600@60,0x0,1.30
      input {
        kb_layout=us 
        follow_mouse=1
      }
      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }
      general {
        gaps_in = 10
        gaps_out = 20
        border_size = 0
        layout = dwindle # master|dwindle
      }
      dwindle {
        no_gaps_when_only = false
        force_split = 0 
        special_scale_factor = 0.8
        split_width_multiplier = 1.0 
        use_active_for_splits = true
        pseudotile = yes 
        preserve_split = yes 
      }
      master {
        new_is_master = true
        special_scale_factor = 0.8
        new_is_master = true
        no_gaps_when_only = false
      }
      decoration {
        rounding = 50
        active_opacity = 1.0
        inactive_opacity = 0.90
        fullscreen_opacity = 1.0
        rounding = 0
        blur = false
        blur_size = 2
        blur_passes = 1
        blur_new_optimizations = true
        drop_shadow = 0
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
        dim_inactive = true
        dim_strength = 0.15
      }
      animations {
        enabled=1
        bezier = overshot, 0.13, 0.99, 0.29, 1
        animation = windows, 1, 2, overshot, slide
        animation = windowsOut, 1, 3, default, popin 10%
        animation = border, 1, 3, default
        animation = fade, 1, 4, default
        animation = workspaces, 1, 3, overshot, slidevert
      }
      # ----------------------------------------------------------------
      # keybindings
      bind = $mainMod, Return, exec, wezterm
      bind = $mainMod, Q, killactive,
      bind = $mainMod, F, fullscreen,
      bind = $mainMod, Space, togglefloating,
      bind = $mainMod, D, exec, pkill wofi || wofi --show drun
      bind = $mainMod, X, exec, pkill wlogout || wlogout
      bind = $mainMod, C, exec, hyprctl dispatch centerwindow none
      bind = $mainMod, P, pseudo,
      bind = $mainMod, Y, pin,
      # bind = $mainMod, J, togglesplit,
      bind = $mainMod, E, exec, thunar
      bind = $mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped
      bind = $mainMod SHIFT, c ,exec, hyprpicker -a
      # ----------------------------------------------------------------
      # screenshot
      bind=,Print,exec,grim $HOME/Pictures/$(date +'%Y%m%d%H%M%S_1.png') && notify-send 'Screenshot Saved'
      bind=$mainMod SHIFT,Print,exec,grim - | wl-copy && notify-send 'Screenshot Copied to Clipboard'
      bind=$mainMod,Print,exec,slurp | grim -g - $HOME/Pictures/$(date +'%Y%m%d%H%M%S_1.png') && notify-send 'Screenshot Saved'
      # ----------------------------------------------------------------
      # switch focus
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d
      # ----------------------------------------------------------------
      # switch workspace
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      # ----------------------------------------------------------------
      # move window to workspace 
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

      bind=SUPER SHIFT, H, movewindow, l
      bind=SUPER SHIFT, L, movewindow, r
      bind=SUPER SHIFT, K, movewindow, u
      bind=SUPER SHIFT, J, movewindow, d

      bind=SUPER CTRL, H, resizeactive, -40 0
      bind=SUPER CTRL, L, resizeactive, 40 0
      bind=SUPER CTRL, K, resizeactive, 0 -40
      bind=SUPER CTRL, J, resizeactive, 0 40
      # ----------------------------------------------------------------
      # media and volume controls
      bind=,XF86AudioRaiseVolume,exec, pamixer -i 5
      bind=,XF86AudioLowerVolume,exec, pamixer -d 5
      bind=,XF86AudioMute,exec, pamixer -t
      bind=,XF86AudioPlay,exec, playerctl play-pause
      bind=,XF86AudioNext,exec, playerctl next
      bind=,XF86AudioPrev,exec, playerctl previous
      bind=, XF86AudioStop, exec, playerctl stop
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bind = $mainMod, mouse_down, workspace, e-1
      bind = $mainMod, mouse_up, workspace, e+1
      windowrule=float,wlogout
      windowrule=noanim,^(wlogout)$
      windowrule=float,title:^(Picture-in-Picture)$
      windowrule=float,mpv
      windowrule=move 25%-,mpv
      windowrule=size 960 540,mpv
      windowrule=animation popin,wezterm

      # autostart
      exec-once = waybar &
      exec-once = swww init && swww img ~/.local/share/wallpapers/4.png &
      # exec-once = dbus-hyprland-environment &
    '';
  };
}
