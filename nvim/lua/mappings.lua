local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- SMART SPLIT NAVIGATION (Synced with tmux)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- SAVE / QUIT
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Force quit all" })

-- BUFFER NAVIGATION
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })

-- TELESCOPE (Primary Navigation Layer)
local telescope = require("telescope.builtin")

map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Help tags" })
map("n", "<leader>fr", telescope.oldfiles, { desc = "Recent files" })

-- LSP KEYBINDINGS
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

-- GIT
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Git diff" })

-- TERMINAL
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- MOVE LINES (VISUAL MODE)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- QUICK ESCAPE
map("i", "jk", "<ESC>", opts)

-- CENTER AFTER SEARCH
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- KEEP CURSOR CENTERED WHEN SCROLLING
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Harpoon
local harpoon = require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
map("n", "<leader>1", function() ui.nav_file(1) end)
map("n", "<leader>2", function() ui.nav_file(2) end)
map("n", "<leader>3", function() ui.nav_file(3) end)
map("n", "<leader>4", function() ui.nav_file(4) end)
map("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon menu" })
