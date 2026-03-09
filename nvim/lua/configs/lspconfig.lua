require("nvchad.configs.lspconfig").defaults()

local servers = {
  "lua_ls",
  "pyright",
  "clangd",
  "jdtls",
  "html",
  "cssls",
  "tsserver",
}

vim.lsp.enable(servers)
vim.lsp.handlers["$/progress"] = function() end
