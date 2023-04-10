-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font     	= wezterm.font("JetBrains Mono")
config.font_size	= 14.0

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Appearance
config.window_background_opacity = 0.9
config.window_decorations = "NONE"

-- TODO:
--  - new workspace
--  - switch between workspaces
-- Keybinds
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- splits
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- pane navigation
  {
    key = 'h',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Left'),
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Right'),
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Up'),
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = act.ActivatePaneDirection('Down'),
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = act.CloseCurrentPane({ confirm = true }),
  },
  -- window naviation
  {
    key = '1',
    mods = 'ALT',
    action = act.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'ALT',
    action = act.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'ALT',
    action = act.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'ALT',
    action = act.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'ALT',
    action = act.ActivateTab(4),
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'g',
    mods = 'LEADER',
    action = act.SpawnCommandInNewTab({
      args = { 'lazygit' }
    }),
  },
  -- Rotate panes
  -- https://wezfurlong.org/wezterm/config/lua/keyassignment/RotatePanes.html

}

return config
