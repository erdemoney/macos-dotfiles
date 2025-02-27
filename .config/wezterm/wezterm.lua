local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local base00 = "#1a1a1a"
local base01 = "#222222"
local base02 = "#1d414d"
local base03 = "#767676"
local base04 = "#b8b8b8"
local base05 = "#cccccc"
-- local base06 = "#e8e8e8"
local base07 = "#f8f8f8"
local base08 = "#d88568"
-- local base09 = "#d86868"
local base0A = "#b99353"
local base0B = "#83a471"
local base0C = "#7c9cae"
local base0D = "#8eccdd"
local base0E = "#b98eb2"
-- local base0F = "#8b6c37"

config.colors = {
  foreground = base05,
  background = base00,
  cursor_bg = base05,
  cursor_fg = base00,
  cursor_border = base05,
  selection_fg = base05,
  selection_bg = base02,

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = base02,

  split = base02,

  ansi = {
    base00,
    base08,
    base0B,
    base0A,
    base0D,
    base0E,
    base0C,
    base05,
  },
  brights = {
    base03,
    base08,
    base0B,
    base0A,
    base0D,
    base0E,
    base0C,
    base07,
  },

  compose_cursor = base0D,
  copy_mode_active_highlight_bg = { Color = base02 },
  copy_mode_active_highlight_fg = { Color = base05 },
  copy_mode_inactive_highlight_bg = { Color = base01 },
  copy_mode_inactive_highlight_fg = { Color = base04 },
  quick_select_label_bg = { Color = base0A },
  quick_select_label_fg = { Color = base00 },
  quick_select_match_bg = { Color = base02 },
  quick_select_match_fg = { Color = base05 },
}


config.show_update_window = false
-- config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true

local symmetrical = 50
config.window_padding = {
  left = symmetrical,
  right = symmetrical,
  top = symmetrical,
  bottom = symmetrical
}

config.scrollback_lines = 10000000

config.keys = {
  {
    key = "p",
    mods = "CTRL",
    action = act.ActivateKeyTable {
      name = "activate_pane",
      one_shot = true,
    },
  },
  {
    key = "n",
    mods = "CTRL",
    action = act.ActivateKeyTable {
      name = "resize_pane",
      one_shot = false,
    },
  },
}

config.key_tables = {
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter', action = 'PopKeyTable' },
  },

  activate_pane = {
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },

    { key = 'n', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain'} },
    { key = 'd', action = act.SplitVertical{ domain = 'CurrentPaneDomain'} },

    { key = 'x', action = act.CloseCurrentPane { confirm = true } },

    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'Enter', action = 'PopKeyTable' },
  },
}

return config
