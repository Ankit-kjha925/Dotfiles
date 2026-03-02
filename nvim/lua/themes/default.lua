local M = {}
-- =========================
-- UI STRUCTURE (unchanged layout)
-- =========================

M.base_30 = {
   white = "#BFD4E1",           -- editor.foreground
   darker_black = "#000000",
   black = "#000000",
   black2 = "#000000",
   one_bg = "#000000",
   one_bg2 = "#222222",
   one_bg3 = "#353535",
   grey = "#666666",
   grey_fg = "#999999",
   grey_fg2 = "#808080",
   light_grey = "#BFD4E1",

   red = "#d97397",             -- errorForeground
   baby_pink = "#E9AEBA",       -- function
   pink = "#E9AEBA",

   line = "#222222",

   green = "#b5cea8",           -- numbers
   vibrant_green = "#CEE397",   -- strings

   nord_blue = "#63B0C6",       -- variables
   blue = "#63B0C6",

   yellow = "#E9CA5C",          -- keywords/constants
   sun = "#E9CA5C",

   purple = "#B5B5AD",          -- types
   dark_purple = "#B5B5AD",

   teal = "#70C1B3",            -- regex
   orange = "#d7ba7d",          -- escapes
   cyan = "#6796e6",

   statusline_bg = "#000000",
   lightbg = "#000000",
   pmenu_bg = "#000000",
   folder_bg = "#BFD4E1",
   lavender = "#BFD4E1",
}

M.base_16 = {
   base00 = "#000000",  -- editor.background
   base01 = "#222222",
   base02 = "#353535",
   base03 = "#666666",
   base04 = "#808080",
   base05 = "#BFD4E1",  -- main foreground
   base06 = "#BFD4E1",
   base07 = "#BFD4E1",

   base08 = "#d97397",  -- errors
   base09 = "#b5cea8",  -- numbers
   base0A = "#E9CA5C",  -- keywords
   base0B = "#CEE397",  -- strings
   base0C = "#70C1B3",  -- regex
   base0D = "#63B0C6",  -- variables
   base0E = "#B5B5AD",  -- types
   base0F = "#d7ba7d",  -- escapes
}

-- =========================
-- STRICT VS CODE TOKEN COLORS
-- =========================

M.polish_hl = {

  -- Default text
  Normal = { fg = "#BFD4E1", bg = "#000000" },

  -- Comments
  Comment = { fg = "#729098", italic = true },

  -- Keywords
  Keyword = { fg = "#E9CA5C" },
  TSKeyword = { fg = "#E9CA5C" },

  -- Operators
  Operator = { fg = "#d4d4d4" },
  TSOperator = { fg = "#d4d4d4" },

  -- Functions
  Function = { fg = "#E9AEBA" },
  TSFunction = { fg = "#E9AEBA" },

  -- Variables
  Identifier = { fg = "#63B0C6" },
  TSVariable = { fg = "#63B0C6" },
  TSField = { fg = "#63B0C6" },
  TSProperty = { fg = "#63B0C6" },

  -- Types / Classes
  Type = { fg = "#B5B5AD" },
  TSType = { fg = "#B5B5AD" },

  -- Strings
  String = { fg = "#CEE397" },
  TSString = { fg = "#CEE397" },
  TSStringEscape = { fg = "#d7ba7d" },
  TSStringRegex = { fg = "#70C1B3" },

  -- Numbers
  Number = { fg = "#b5cea8" },
  TSNumber = { fg = "#b5cea8" },
  TSFloat = { fg = "#b5cea8" },

  -- Constants
  Constant = { fg = "#E9CA5C" },
  TSConstant = { fg = "#E9CA5C" },

  -- Tags
  TSTag = { fg = "#E9CA5C" },
  TSTagDelimiter = { fg = "#808080" },
  TSTagAttribute = { fg = "#63B0C6" },

  -- Errors
  Error = { fg = "#f44747" },
  DiagnosticError = { fg = "#d97397" },

  -- Warnings / Info
  DiagnosticWarn = { fg = "#BFD4E1" },
  DiagnosticInfo = { fg = "#BFD4E1" },
  DiagnosticHint = { fg = "#BFD4E1" },

}

M.type = "dark"
M = require("base46").override_theme(M, "SAGA")

return M
