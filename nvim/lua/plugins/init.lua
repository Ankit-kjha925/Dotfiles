return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  -- comment this plugin if indentlines are needed.
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Debuggers
      "debugpy",               -- Python
      "codelldb",              -- C/C++
      "java-debug-adapter",    -- Java
      "js-debug-adapter",      -- JS/TS
    },
  },
},
}
-- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

