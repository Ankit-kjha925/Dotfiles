require "nvchad.options"

local opt = vim.opt

-- general
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪"
opt.scrolloff = 10

-- line numbers
opt.number = true
opt.relativenumber = true

-- cursor
opt.cursorline = true
opt.cursorlineopt = "both"

-- performance
opt.updatetime = 300
opt.timeoutlen = 400

-- misc
opt.confirm = true


