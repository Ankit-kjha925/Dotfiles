return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },

    config = function()
      local noice = require("noice")

      noice.setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline = { pattern = "", icon = "󱐌 :", lang = "vim" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰮦 :" },
            search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "/", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$ :", lang = "bash" },
            lua = {
              pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
              icon = " :",
              lang = "lua",
            },
            input = { view = "cmdline_input", icon = "󰥻 :" },
          },
        },

        -- 🔹 THIS SECTION FIXES THE POSITION (NvChad style)
        views = {
          cmdline_popup = {
            relative = "editor",
            position = {
              row = 6,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
            },
            win_options = {
              winhighlight = {
                Normal = "NormalFloat",
                FloatBorder = "DiagnosticInfo",
              },
            },
          },

          cmdline_input = {
            relative = "editor",
            position = {
              row = 6,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
            },
          },

          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "DiagnosticInfo",
              },
            },
          },

          mini = {
            size = {
              width = "auto",
              height = "auto",
              max_height = 15,
            },
            position = {
              row = -2,
              col = "100%",
            },
          },
        },

        -- 🔹 NvChad-like command palette behaviour
        presets = {
          command_palette = true,
          long_message_to_split = true,
        },

        lsp = {
          progress = { enabled = true },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            auto_open = { enabled = false },
          },
        },

        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
                { find = "%d fewer lines" },
                { find = "%d more lines" },
              },
            },
            opts = { skip = true },
          },
        },

        messages = { enabled = false },

        health = { checker = true },

        popupmenu = {
          enabled = true,
          backend = "cmp",
        },

        signature = { enabled = true },
      })
    end,
  },
}
