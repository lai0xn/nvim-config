-- Handmade: Casey Muratori's Handmade Hero / 4coder look
-- near-black bg, tan text, goldenrod keywords, olive strings, grey comments.
-- Most code stays plain text on purpose.

local M = {}

local p = {
  bg = "#161616",
  bg_dark = "#0f0f0f",
  bg1 = "#1e1e1e",
  bg2 = "#262626",
  bg3 = "#303030",
  bg4 = "#3d3d3d",
  mark = "#494949",

  text = "#a08563", -- tan, the main code color
  burly = "#cdaa7d", -- brighter tan for UI text
  sand = "#dab98f", -- preprocessor / macros
  keyword = "#cd950c", -- goldenrod
  type = "#d8a51d",
  olive = "#6b8e23", -- strings, numbers, constants
  comment = "#7d7d7d",

  line_hl = "#1b221b", -- faint green current line, like 4coder
  visual = "#1f2a44", -- navy selection
  cursor = "#40ff40",
  red = "#d05a4a",
  green = "#8faa3c",
  blue = "#6a8aa0",
}

M.base_30 = {
  white = p.burly,
  darker_black = p.bg_dark,
  black = p.bg, -- nvim bg
  black2 = p.bg1,
  one_bg = "#222222",
  one_bg2 = p.bg2,
  one_bg3 = p.bg3,
  grey = p.bg4,
  grey_fg = p.mark,
  grey_fg2 = "#5a5a5a",
  light_grey = p.comment,
  red = p.red,
  baby_pink = "#c07060",
  pink = "#b07a8a",
  line = p.bg2, -- for lines like vertsplit
  green = p.olive,
  vibrant_green = p.green,
  nord_blue = "#7a95a8",
  blue = p.blue,
  yellow = p.keyword,
  sun = p.sand,
  purple = "#9a7fa0",
  dark_purple = "#7f6a8a",
  teal = "#5f8a78",
  orange = "#d08a3c",
  cyan = "#7fa090",
  statusline_bg = "#111111",
  lightbg = p.bg3,
  pmenu_bg = p.keyword,
  folder_bg = p.text,
}

M.base_16 = {
  base00 = p.bg,
  base01 = p.bg1,
  base02 = p.bg3,
  base03 = p.bg4,
  base04 = p.comment,
  base05 = p.text,
  base06 = p.burly,
  base07 = p.sand,
  base08 = p.text, -- identifiers, fields: plain
  base09 = p.olive, -- constants, numbers
  base0A = p.type, -- types
  base0B = p.olive, -- strings
  base0C = p.sand, -- specials
  base0D = p.text, -- functions: plain
  base0E = p.keyword, -- keywords
  base0F = p.text, -- punctuation: plain
}

local plain = { fg = p.text }
local kw = { fg = p.keyword }
local pre = { fg = p.sand }
local lit = { fg = p.olive }
local ty = { fg = p.type }

M.polish_hl = {
  defaults = {
    Normal = { fg = p.text, bg = p.bg },
    Comment = { fg = p.comment },
    CursorLine = { bg = p.line_hl },
    CursorLineNr = { fg = p.keyword },
    LineNr = { fg = "#555555" },
    Visual = { bg = p.visual },
    Search = { fg = p.bg, bg = p.keyword },
    IncSearch = { fg = p.bg, bg = p.cursor },
    CurSearch = { fg = p.bg, bg = p.cursor },
    MatchParen = { bg = p.bg4, bold = true },
    Cursor = { fg = p.bg, bg = p.cursor },
    lCursor = { fg = p.bg, bg = p.cursor },
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
    String = lit,
    Character = lit,
    Function = plain,
    Identifier = plain,
    Variable = plain,
    Operator = plain,
    Delimiter = plain,
    Special = pre,
    SpecialChar = pre,
    Tag = kw,
    Todo = { fg = p.red, bg = "NONE", bold = true },
  },

  treesitter = {
    ["@comment"] = { fg = p.comment },
    ["@comment.todo"] = { fg = p.red, bg = "NONE", bold = true },
    ["@comment.error"] = { fg = p.red, bg = "NONE", bold = true },
    ["@comment.danger"] = { fg = p.red, bg = "NONE", bold = true },
    ["@comment.warning"] = { fg = p.keyword, bg = "NONE", bold = true },
    ["@comment.note"] = { fg = p.green, bg = "NONE", bold = true },

    ["@variable"] = plain,
    ["@variable.builtin"] = kw, -- this
    ["@variable.parameter"] = plain,
    ["@variable.member"] = plain,
    ["@variable.member.key"] = plain,
    ["@property"] = plain,
    ["@module"] = plain,
    ["@label"] = kw,

    ["@constant"] = lit,
    ["@constant.builtin"] = lit,
    ["@constant.macro"] = pre,
    ["@string"] = lit,
    ["@string.escape"] = pre,
    ["@string.regex"] = lit,
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

    ["@function"] = plain,
    ["@function.call"] = plain,
    ["@function.builtin"] = plain,
    ["@function.method"] = plain,
    ["@function.method.call"] = plain,
    ["@function.macro"] = pre,
    ["@constructor"] = plain,

    ["@type"] = ty,
    ["@type.builtin"] = ty,
    ["@type.definition"] = ty,
    ["@attribute"] = pre,
    ["@annotation"] = pre,

    ["@operator"] = plain,
    ["@punctuation.bracket"] = plain,
    ["@punctuation.delimiter"] = plain,
    ["@punctuation.special"] = plain,

    ["@tag"] = kw,
    ["@tag.attribute"] = plain,
    ["@tag.delimiter"] = plain,

    ["@markup.heading"] = { fg = p.keyword, bold = true },
    ["@markup.raw"] = lit,
    ["@markup.link"] = plain,
    ["@markup.link.url"] = { fg = p.text, underline = true },
    ["@markup.list"] = kw,
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "handmade")

return M
