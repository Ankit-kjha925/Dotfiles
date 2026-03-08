require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "Command mode", noremap = true })

-- exit terminal with ESC
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- exit insert mode
map({ "i", "v", "s" }, "jk", "<ESC>", { desc = "Exit mode" })

-- =========================
-- SMART SPLIT NAVIGATION (tmux friendly)
-- =========================
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)

-- TERMINAL NAVIGATION
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

-- =========================
-- SAVE / QUIT
-- =========================
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>Q", "<cmd>qa!<CR>", opts)

-- =========================
-- BUFFER NAVIGATION
-- =========================
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- =========================
-- TELESCOPE
-- =========================
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts)

-- =========================
-- LSP
-- =========================
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, opts)

-- =========================
-- TOGGLETERM (FLOATING)
-- =========================
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", opts)
map("t", "<Esc>", [[<C-\><C-n>]], opts)

-- =========================
-- OIL
-- =========================
map("n", "-", "<cmd>Oil<CR>", opts)

-- =========================
-- FLASH
-- =========================
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, opts)

-- =========================
-- HARPOON (v2 branch)
-- =========================
map("n", "<leader>a", function()
  require("harpoon"):list():add()
end, opts)

map("n", "<leader>e", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, opts)
