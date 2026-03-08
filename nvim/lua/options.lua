require "nvchad.options"

local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- cursor
opt.cursorline = true
opt.cursorlineopt = "both"

-- scrolling
opt.scrolloff = 10
opt.sidescrolloff = 10

-- performance
opt.updatetime = 300
opt.timeoutlen = 400

-- misc
opt.confirm = true
opt.wrap = false

-- reduce message spam
--vim.opt.shortmess:append("c")
--vim.opt.shortmess:append("s")
--vim.opt.shortmess:append("I")
--vim.opt.shortmess:append("W")
--vim.opt.shortmess:append("y")
