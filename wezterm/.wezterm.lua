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
  -- Pane Navigation
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = "UpArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "DownArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
}

return config
