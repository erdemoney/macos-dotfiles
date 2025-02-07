local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

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
