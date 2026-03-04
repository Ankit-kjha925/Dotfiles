require "nvchad.options"

-- add yours here!

local opt = vim.opt

opt.shortmess:append("y")

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.cursorlineopt = "both"

opt.scrolloff = 10
opt.sidescrolloff = 10

opt.updatetime = 300
opt.timeoutlen = 400

opt.confirm = true
opt.wrap = false

opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"

opt.shortmess:append("c")
opt.shortmess:append("s")
opt.shortmess:append("I")
opt.shortmess:append("W")
opt.shortmess:append("y")
