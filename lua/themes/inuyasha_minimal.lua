-- Minimal variant of inuyasha: same navy base, only keywords, types,
-- strings, numbers and functions are colored. No purple, no cyan.

local M = {}

M.base_30 = {
  white = "#FFFDFB",
  darker_black = "#191c27",
  black = "#212532",
  black2 = "#272b3a",
  one_bg = "#2b303f",
  one_bg2 = "#333848",
  one_bg3 = "#3b4152",
  grey = "#474d62",
  grey_fg = "#4e5468",
  grey_fg2 = "#5c6379",
  light_grey = "#7d8497",
  red = "#CA7081",
  baby_pink = "#E18163",
  pink = "#CA7081",
  green = "#4EB67F",
  vibrant_green = "#50B584",
  nord_blue = "#6e8dd5",
  blue = "#8C96EC",
  yellow = "#e0af68",
  sun = "#ffc777",
  purple = "#CA7081",
  dark_purple = "#CA7081",
  orange = "#CE9042",
  teal = "#00a6c8",
  cyan = "#00B3C2",
  line = "#2d3241",
  statusline_bg = "#1d2029",
  lightbg = "#333848",
  pmenu_bg = "#4EB67F",
  folder_bg = "#8C96EC",
}



M.base_16 = {
  base00 = "#212532",
  base01 = "#191c27",
  base02 = "#333848",
  base03 = "#474d62",
  base04 = "#7d8497",
  base05 = "#D8D8D8", -- normal text
  base06 = "#F2E6D4",
  base07 = "#FFF7ED",
  base08 = "#D8D8D8", -- identifiers, fields, properties (plain)
  base09 = "#A3D1FF", -- numbers, constants (light blue)
  base0A = "#e0af68", -- types, storage (gold)
  base0B = "#5cbc94", -- strings (green)
  base0C = "#56B6C2", -- specials, escapes (cyan)
  base0D = "#ffc777", -- functions (bright yellow)
  base0E = "#CA7081", -- keywords (rose)
  base0F = "#7C839A", -- punctuation (grey blue)
}

local c = M.base_30
local b = M.base_16

local plain = { fg = b.base05 }
local punct = { fg = b.base0F }
local kw = { fg = b.base0E }
local ty = { fg = b.base0A }
local fn = { fg = b.base0D }
local field = { fg = b.base05 }
local str = { fg = b.base0B }
local num = { fg = b.base09 }
local const = { fg = b.base09 }
local op = { fg = b.base05 }
local param = { fg = b.base05 }
local ns = { fg = b.base05 }

M.polish_hl = {
  defaults = {
    Comment = { fg = "#7a8194", italic = true },
    CursorLine = { bg = "#272b3a" },
    CursorLineNr = { fg = c.yellow },
    LineNr = { fg = "#4b5165" },
    Visual = { bg = "#363c4e" },
    MatchParen = { bg = "#474d62", bold = true },
  },

  syntax = {
    Constant = const,
    Boolean = const,
    Number = num,
    Float = num,
    Character = str,
    String = str,
    Type = ty,
    Typedef = ty,
    StorageClass = ty,
    Structure = ty,
    Repeat = kw,
    Conditional = kw,
    Label = kw,
    Exception = kw,
    Operator = op,
    Function = fn,
    Identifier = field,
    Delimiter = punct,
    PreProc = ns,
    Include = ns,
    Define = ns,
    Macro = ns,
    Special = op,
    SpecialChar = { fg = c.orange },
  },

  treesitter = {
    ["@comment"] = { fg = "#7a8194", italic = true },

    ["@variable"] = plain,
    ["@variable.builtin"] = const, -- self / this
    ["@variable.parameter"] = param,
    ["@variable.member"] = field,
    ["@variable.member.key"] = const,
    ["@property"] = field,
    ["@module"] = ns,

    ["@constant"] = const,
    ["@constant.builtin"] = const,
    ["@constant.macro"] = ns,
    ["@boolean"] = const,
    ["@number"] = num,
    ["@number.float"] = num,
    ["@string"] = str,
    ["@character"] = str,
    ["@string.escape"] = { fg = c.orange },
    ["@string.regex"] = op,

    ["@keyword"] = kw,
    ["@keyword.function"] = kw,
    ["@keyword.return"] = kw,
    ["@keyword.operator"] = kw,
    ["@keyword.conditional"] = kw,
    ["@keyword.repeat"] = kw,
    ["@keyword.exception"] = kw,
    ["@keyword.storage"] = ty,
    ["@keyword.modifier"] = ty,
    ["@keyword.import"] = ns,
    ["@keyword.directive"] = ns,
    ["@keyword.directive.define"] = ns,

    ["@function"] = { fg = b.base0D, bold = true },
    ["@function.call"] = fn,
    ["@function.method"] = { fg = b.base0D, bold = true },
    ["@function.method.call"] = fn,
    ["@function.builtin"] = fn,
    ["@function.macro"] = ns,
    ["@constructor"] = ty,

    ["@type"] = ty,
    ["@type.builtin"] = ty,
    ["@type.definition"] = ty,
    ["@attribute"] = ns,
    ["@annotation"] = ns,

    ["@operator"] = op,
    ["@punctuation.bracket"] = punct,
    ["@punctuation.delimiter"] = punct,
    ["@punctuation.special"] = op,

    ["@tag"] = kw,
    ["@tag.attribute"] = ns,
    ["@tag.delimiter"] = punct,

    ["@markup.heading"] = { fg = b.base0D, bold = true },
    ["@markup.raw"] = str,
    ["@markup.link"] = field,
    ["@markup.link.url"] = { fg = b.base09, underline = true },
    ["@markup.list"] = kw,
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "inuyasha_minimal")

return M
