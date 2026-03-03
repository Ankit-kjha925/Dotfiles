-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
---@type ChadrcConfig
local M = {}

-- Leader key must be defined before anything
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---@diagnostic disable-next-line
M.base46 = {
  theme = "default",
}

M.nvdash = {
  load_on_startup = false,
}

return M
