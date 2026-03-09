return {

  -- =========================
  -- vim-tmux-navigator
  -- =========================
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

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
    opts = {
      direction = "float",
      float_opts = { border = "curved" },
    },
  },

  -- =========================
  -- Oil
  -- =========================
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = {},
  },

  -- =========================
  -- Flash
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
      require("harpoon"):setup()
    end,
  },

  -- =========================
  -- Noice
  -- =========================
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    opts = {
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
    },
  },

  {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#000000",
  },
},

  -- =========================
  -- mini.surround
  -- =========================
  {
    "echasnovski/mini.surround",
    version = false,
    opts = {},
  },

  -- =========================
  -- Disable indent guides
  -- =========================
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

}
