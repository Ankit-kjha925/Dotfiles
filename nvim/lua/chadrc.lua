-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
---@type ChadrcConfig
local M = {}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- detect terminal
--local term = vim.env.WEZTERM_EXECUTABLE ~= nil
--local is_ghostty = vim.env.GHOSTTY_RESOURCES_DIR ~= nil

local theme = "tokyonight"

--if term == "WezTerm" then
  --theme = "tokyonight"
--elseif is_ghostty then
  --theme = "tokyonight"
--end

M.base46 = {
  theme = theme,
  transparency = true
}


M.nvdash = {
  load_on_startup = false,
}

return M
