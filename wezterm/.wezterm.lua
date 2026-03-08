local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- General
config.font_size = 15
config.line_height = 1
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.window_background_opacity = 0.75
config.macos_window_background_blur = 15

config.colors = {
  cursor_bg = "#7aa2f7",
  cursor_border = "#7aa2f7",
}

config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- Disable close confirmation
config.window_close_confirmation = "NeverPrompt"

-- Key Bindings
config.keys = {
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  config.keys = {

  -- splits (tmux style)
  {
    key = "|",
    mods = "SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  {
    key = "-",
    mods = "NONE",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },

  -- navigation
  {
    key = "h",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Left",
  },

  {
    key = "j",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Down",
  },

  {
    key = "k",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Up",
  },

  {
    key = "l",
    mods = "CTRL",
    action = wezterm.action.ActivatePaneDirection "Right",
  },

  -- resizing
  {
    key = "H",
    mods = "SHIFT",
    action = wezterm.action.AdjustPaneSize { "Left", 5 },
  },

  {
    key = "J",
    mods = "SHIFT",
    action = wezterm.action.AdjustPaneSize { "Down", 5 },
  },

  {
    key = "K",
    mods = "SHIFT",
    action = wezterm.action.AdjustPaneSize { "Up", 5 },
  },

  {
    key = "L",
    mods = "SHIFT",
    action = wezterm.action.AdjustPaneSize { "Right", 5 },
  },

}

return config
