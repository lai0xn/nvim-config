-- Gruvbox minimal: dark neutral bg, gruvbox accents on keywords, types,
-- strings, constants, functions, fields, operators and preprocessor.
-- Variables and parameters stay plain text.

local M = {}

local p = {
  bg = "#1b1a19",
  bg_dark = "#141413",
  bg1 = "#232220",
  bg2 = "#272624",
  bg3 = "#2e2c2a",
  bg4 = "#363431",
  bg5 = "#45413d",

  fg = "#d5c4a1",
  fg_bright = "#ebdbb2",
  fg_dim = "#a89984", -- punctuation
  gray = "#928374", -- comments
  gray_dim = "#665c54",

  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",
}

M.base_30 = {
  white = p.fg_bright,
  darker_black = p.bg_dark,
  black = p.bg, -- nvim bg
  black2 = p.bg1,
  one_bg = p.bg2,
  one_bg2 = p.bg3,
  one_bg3 = p.bg4,
  grey = p.bg5,
  grey_fg = "#4a4541",
  grey_fg2 = p.gray_dim,
  light_grey = "#7c6f64",
  red = p.red,
  baby_pink = "#cc241d",
  pink = p.purple,
  line = "#2b2927", -- for lines like vertsplit
  green = p.green,
  vibrant_green = p.aqua,
  nord_blue = p.blue,
  blue = p.blue,
  yellow = "#d79921",
  sun = p.yellow,
  purple = p.purple,
  dark_purple = "#b16286",
  teal = "#689d6a",
  orange = p.orange,
  cyan = p.aqua,
  statusline_bg = "#171615",
  lightbg = p.bg4,
  pmenu_bg = p.yellow,
  folder_bg = p.fg_dim,
}

M.base_16 = {
  base00 = p.bg,
  base01 = p.bg1,
  base02 = p.bg4,
  base03 = p.bg5,
  base04 = p.fg_dim,
  base05 = p.fg,
  base06 = p.fg_bright,
  base07 = "#fbf1c7",
  base08 = p.blue, -- identifiers, fields
  base09 = p.purple, -- constants, numbers
  base0A = p.yellow, -- types
  base0B = p.green, -- strings
  base0C = p.aqua, -- specials
  base0D = p.green, -- functions
  base0E = p.red, -- keywords
  base0F = p.fg_dim, -- punctuation
}

local plain = { fg = p.fg }
local punct = { fg = p.fg_dim }
local kw = { fg = p.red }
local pre = { fg = p.aqua }
local lit = { fg = p.purple }
local str = { fg = p.green }
local ty = { fg = p.yellow }
local fn = { fg = p.green }
local field = { fg = p.blue }
local op = { fg = p.orange }

M.polish_hl = {
  defaults = {
    Normal = { fg = p.fg, bg = p.bg },
    Comment = { fg = p.gray, italic = true },
    CursorLine = { bg = p.bg1 },
    CursorLineNr = { fg = p.yellow },
    LineNr = { fg = "#5a534d" },
    Visual = { bg = "#3c3836" },
    Search = { fg = p.bg, bg = p.yellow },
    IncSearch = { fg = p.bg, bg = p.orange },
    CurSearch = { fg = p.bg, bg = p.orange },
    MatchParen = { bg = p.bg5, bold = true },
    WinSeparator = { fg = "#2b2927" },
  },

  syntax = {
    Statement = kw,
    Conditional = kw,
    Repeat = kw,
    Keyword = kw,
    Label = kw,
    Exception = kw,
    StorageClass = kw,
    Structure = kw,
    Typedef = kw,
    PreProc = pre,
    Include = pre,
    Define = pre,
    Macro = pre,
    Type = ty,
    Constant = lit,
    Number = lit,
    Float = lit,
    Boolean = lit,
    Character = lit,
    String = str,
    Function = { fg = p.green, bold = true },
    Identifier = field,
    Variable = plain,
    Operator = op,
    Delimiter = punct,
    Special = op,
    SpecialChar = pre,
    Tag = kw,
    Todo = { fg = p.yellow, bg = "NONE", bold = true },
  },

  treesitter = {
    ["@comment"] = { fg = p.gray, italic = true },
    ["@comment.todo"] = { fg = p.yellow, bg = "NONE", bold = true },
    ["@comment.error"] = { fg = p.red, bg = "NONE", bold = true },
    ["@comment.danger"] = { fg = p.red, bg = "NONE", bold = true },
    ["@comment.warning"] = { fg = p.orange, bg = "NONE", bold = true },
    ["@comment.note"] = { fg = p.aqua, bg = "NONE", bold = true },

    ["@variable"] = plain,
    ["@variable.builtin"] = op, -- this / self
    ["@variable.parameter"] = plain,
    ["@variable.member"] = field,
    ["@variable.member.key"] = field,
    ["@property"] = field,
    ["@module"] = pre,
    ["@label"] = kw,

    ["@constant"] = lit,
    ["@constant.builtin"] = lit,
    ["@constant.macro"] = pre,
    ["@string"] = str,
    ["@string.escape"] = pre,
    ["@string.regex"] = str,
    ["@string.special"] = pre,
    ["@character"] = lit,
    ["@number"] = lit,
    ["@number.float"] = lit,
    ["@boolean"] = lit,

    ["@keyword"] = kw,
    ["@keyword.function"] = kw,
    ["@keyword.return"] = kw,
    ["@keyword.operator"] = kw,
    ["@keyword.conditional"] = kw,
    ["@keyword.conditional.ternary"] = plain,
    ["@keyword.repeat"] = kw,
    ["@keyword.exception"] = kw,
    ["@keyword.storage"] = kw,
    ["@keyword.modifier"] = kw,
    ["@keyword.type"] = kw,
    ["@keyword.coroutine"] = kw,
    ["@keyword.import"] = pre,
    ["@keyword.directive"] = pre,
    ["@keyword.directive.define"] = pre,

    ["@function"] = { fg = p.green, bold = true },
    ["@function.call"] = fn,
    ["@function.builtin"] = ty,
    ["@function.method"] = { fg = p.green, bold = true },
    ["@function.method.call"] = fn,
    ["@function.macro"] = pre,
    ["@constructor"] = ty,

    ["@type"] = ty,
    ["@type.builtin"] = ty,
    ["@type.definition"] = ty,
    ["@attribute"] = pre,
    ["@annotation"] = pre,

    ["@operator"] = op,
    ["@punctuation.bracket"] = punct,
    ["@punctuation.delimiter"] = punct,
    ["@punctuation.special"] = op,

    ["@tag"] = kw,
    ["@tag.attribute"] = pre,
    ["@tag.delimiter"] = punct,

    ["@markup.heading"] = { fg = p.yellow, bold = true },
    ["@markup.raw"] = str,
    ["@markup.link"] = field,
    ["@markup.link.url"] = { fg = p.blue, underline = true },
    ["@markup.list"] = kw,
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "gruvbox_minimal")

return M
