-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14.0

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

-- Appearance
config.window_background_opacity = 1.0
-- config.window_decorations            = "NONE"
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = false
config.enable_csi_u_key_encoding = true

config.enable_scroll_bar = false

config.window_padding = {
	left = 6,
	right = 0,
	top = 0,
	bottom = 0,
}

-- TODO:
--  - new workspace
--  - switch between workspaces
-- Keybinds
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- splits
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "t",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},

	{
		key = "o",
		mods = "LEADER",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},

	-- pane navigation
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "q",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	-- window naviation
	{
		key = "1",
		mods = "ALT",
		action = act.ActivateTab(0),
	},
	{
		key = "2",
		mods = "ALT",
		action = act.ActivateTab(1),
	},
	{
		key = "3",
		mods = "ALT",
		action = act.ActivateTab(2),
	},
	{
		key = "4",
		mods = "ALT",
		action = act.ActivateTab(3),
	},
	{
		key = "5",
		mods = "ALT",
		action = act.ActivateTab(4),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "g",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "top" },
		}),
	},
	-- TODO: implement this
	{
		key = "t",
		mods = "SHIFT|ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "Y",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},

	{
		key = "r",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new tab" },
			}),
			-- action = act.SpawnTab 'CurrentPaneDomain',
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					act.SpawnTab({
						DomainName = "CurrentPaneDomain",
						name = line,
					})
				end
			end),
		}),
	},

	{ key = "t", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
	-- Rotate panes
	-- https://wezfurlong.org/wezterm/config/lua/keyassignment/RotatePanes.html
}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return config
