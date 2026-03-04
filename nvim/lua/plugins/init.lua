return {

  -- =========================
  -- Formatting
  -- =========================
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
      },
    },
  },

  -- =========================
  -- Mason
  -- =========================
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

  -- =========================
  -- ToggleTerm
  -- =========================
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup({
        direction = "float",
        float_opts = { border = "curved" },
      })
    end,
  },

  -- =========================
  -- Oil (file manager)
  -- =========================
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    config = function()
      require("oil").setup()
    end,
  },

  -- =========================
  -- Flash (fast jump)
  -- =========================
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- =========================
  -- Harpoon v2
  -- =========================
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
    end,
  },

  -- =========================
  -- Noice UI
  -- =========================
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    config = function()
      require("noice").setup({

        cmdline = {
          view = "cmdline_popup",
          position = { row = "40%", col = "50%" },
          size = { width = 60, height = "auto" },
        },

        messages = {
          view = "mini",
        },

        presets = {
          lsp_doc_border = true,
          command_palette = true,
          bottom_search = false,
        },

      })
    end,
  },

  -- =========================
  -- mini.surround
  -- =========================
  {
    "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
    end,
  },

  -- =========================
  -- Disable indent guides
  -- =========================
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

}
