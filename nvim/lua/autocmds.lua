require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- =========================
-- Highlight text on yank
-- =========================
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})

-- =========================
-- Remove trailing whitespace on save
-- =========================
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

-- =========================
-- Restore cursor position
-- when reopening files
-- =========================
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- =========================
-- Automatically create directories
-- when saving new files
-- =========================
autocmd("BufWritePre", {
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- =========================
-- Auto reload files if changed
-- outside Neovim
-- =========================
autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

-- =========================
-- Disable relative numbers
-- in terminal buffers
-- =========================
autocmd("TermOpen", {
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
  end,
})

-- =========================
-- Equalize splits when resizing
-- =========================
autocmd("VimResized", {
  command = "wincmd =",
})

-- =========================
-- Close certain windows with q
-- =========================
autocmd("FileType", {
  pattern = {
    "help",
    "lspinfo",
    "man",
    "notify",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
  end,
})
