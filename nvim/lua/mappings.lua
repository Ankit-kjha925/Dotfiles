require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- tmux navigator
-- map("n", "<leader>h", "<cmd>TmuxNavigateLeft<CR>",  { desc = "Tmux left" })
-- map("n", "<leader>j", "<cmd>TmuxNavigateDown<CR>",  { desc = "Tmux down" })
-- map("n", "<leader>k", "<cmd>TmuxNavigateUp<CR>",    { desc = "Tmux up" })
-- map("n", "<leader>l", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux right" })

