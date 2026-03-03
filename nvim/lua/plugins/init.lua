return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        typescript = { "prettier" },
      },
    },
  },

  -- Disable indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
        "codelldb",
        "java-debug-adapter",
        "js-debug-adapter",
      },
    },
  },

  -- ToggleTerm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        float_opts = { border = "rounded" },
      })
    end,
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
  },

  -- Oil
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  },

  -- Flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Mini Surround
  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
    end,
  },

  -- Noice UI
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup()
    end,
  },
}
