local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- =========================
-- Appearance
-- =========================
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15
config.line_height = 1

config.window_background_opacity = 0.75
config.macos_window_background_blur = 15

config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- =========================
-- Cursor
-- =========================
config.colors = {
  cursor_bg = "#7aa2f7",
  cursor_border = "#7aa2f7",
}

-- =========================
-- Keybindings
-- =========================
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000, }

config.keys = {

  -- split horizontally
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  -- split vertically
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },

  -- navigation
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Left",
  },

  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Down",
  },

  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Up",
  },

  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Right",
  },

}

return config
