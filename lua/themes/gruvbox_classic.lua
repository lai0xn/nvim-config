-- Gruvbox dark, faithful to https://github.com/morhetz/gruvbox
-- (warm bg/fg ramp + original syntax mapping, unlike base46's "gruvbox")

local M = {}

local p = {
  bg0_h = "#1d2021",
  bg0 = "#282828",
  bg0_s = "#32302f",
  bg1 = "#3c3836",
  bg2 = "#504945",
  bg3 = "#665c54",
  bg4 = "#7c6f64",
  gray = "#928374",
  fg4 = "#a89984",
  fg3 = "#bdae93",
  fg2 = "#d5c4a1",
  fg1 = "#ebdbb2",
  fg0 = "#fbf1c7",

  red = "#fb4934",
  green = "#b8bb26",
  yellow = "#fabd2f",
  blue = "#83a598",
  purple = "#d3869b",
  aqua = "#8ec07c",
  orange = "#fe8019",

  red_dim = "#cc241d",
  green_dim = "#98971a",
  yellow_dim = "#d79921",
  blue_dim = "#458588",
  purple_dim = "#b16286",
  aqua_dim = "#689d6a",
  orange_dim = "#d65d0e",
}

M.base_30 = {
  white = p.fg1,
  darker_black = "#161819",
  black = p.bg0_h, -- nvim bg (hard contrast)
  black2 = "#262626",
  one_bg = "#2c2b2a",
  one_bg2 = p.bg0_s,
  one_bg3 = p.bg1,
  grey = p.bg2,
  grey_fg = p.bg4,
  grey_fg2 = p.gray,
  light_grey = p.fg4,
  red = p.red,
  baby_pink = p.red_dim,
  pink = p.purple,
  line = p.bg0_s, -- for lines like vertsplit
  green = p.green,
  vibrant_green = p.aqua,
  nord_blue = p.blue,
  blue = p.blue,
  yellow = p.yellow_dim,
  sun = p.yellow,
  purple = p.purple,
  dark_purple = p.purple_dim,
  teal = p.aqua_dim,
  orange = p.orange,
  cyan = p.aqua,
  statusline_bg = "#232323",
  lightbg = p.bg1,
  pmenu_bg = p.blue,
  folder_bg = p.blue,
}

M.base_16 = {
  base00 = p.bg0_h,
  base01 = p.bg0,
  base02 = p.bg1,
  base03 = p.bg2,
  base04 = p.fg3,
  base05 = p.fg1,
  base06 = "#f2e5bc",
  base07 = p.fg0,
  base08 = p.blue, -- identifiers, fields, properties
  base09 = p.purple, -- constants, numbers, booleans
  base0A = p.yellow, -- types
  base0B = p.green, -- strings
  base0C = p.aqua, -- specials, regex, constructors
  base0D = p.green, -- functions
  base0E = p.red, -- keywords, conditionals
  base0F = p.orange_dim,
}

M.polish_hl = {
  defaults = {
    Comment = { fg = p.gray, italic = true },
    LineNr = { fg = p.bg4 },
    CursorLineNr = { fg = p.yellow },
    Visual = { bg = p.bg1 },
    Search = { fg = p.bg0, bg = p.yellow },
    IncSearch = { fg = p.bg0, bg = p.orange },
    MatchParen = { bg = p.bg2, bold = true },
  },

  syntax = {
    Statement = { fg = p.red },
    Repeat = { fg = p.red },
    Label = { fg = p.red },
    Include = { fg = p.aqua },
    Define = { fg = p.aqua },
    PreProc = { fg = p.aqua },
    Structure = { fg = p.aqua },
    StorageClass = { fg = p.orange },
    Tag = { fg = p.aqua },
    Special = { fg = p.orange },
    SpecialChar = { fg = p.red },
    Character = { fg = p.purple },
    Function = { fg = p.green, bold = true },
    Operator = { fg = p.fg1 },
    Delimiter = { fg = p.fg4 },
    Todo = { fg = p.fg0, bg = p.bg0_h, bold = true, italic = true },
  },

  treesitter = {
    ["@comment"] = { fg = p.gray, italic = true },
    ["@variable"] = { fg = p.fg1 },
    ["@variable.builtin"] = { fg = p.orange },
    ["@variable.parameter"] = { fg = p.blue },
    ["@variable.member"] = { fg = p.blue },
    ["@property"] = { fg = p.blue },
    ["@module"] = { fg = p.fg1 },

    ["@constant"] = { fg = p.purple },
    ["@constant.builtin"] = { fg = p.purple },
    ["@constant.macro"] = { fg = p.aqua },
    ["@character"] = { fg = p.purple },
    ["@string.escape"] = { fg = p.red },
    ["@string.regex"] = { fg = p.aqua },

    ["@keyword"] = { fg = p.red },
    ["@keyword.function"] = { fg = p.red },
    ["@keyword.return"] = { fg = p.red },
    ["@keyword.operator"] = { fg = p.red },
    ["@keyword.repeat"] = { fg = p.red },
    ["@keyword.exception"] = { fg = p.red },
    ["@keyword.storage"] = { fg = p.orange },
    ["@keyword.directive"] = { fg = p.aqua },
    ["@keyword.directive.define"] = { fg = p.aqua },
    ["@keyword.import"] = { fg = p.aqua },

    ["@function"] = { fg = p.green, bold = true },
    ["@function.call"] = { fg = p.green },
    ["@function.method"] = { fg = p.green, bold = true },
    ["@function.method.call"] = { fg = p.green },
    ["@function.builtin"] = { fg = p.yellow },
    ["@function.macro"] = { fg = p.aqua },
    ["@constructor"] = { fg = p.yellow },

    ["@type"] = { fg = p.yellow },
    ["@type.builtin"] = { fg = p.yellow },
    ["@attribute"] = { fg = p.aqua },
    ["@annotation"] = { fg = p.aqua },

    ["@operator"] = { fg = p.fg1 },
    ["@punctuation.bracket"] = { fg = p.fg4 },
    ["@punctuation.delimiter"] = { fg = p.fg4 },
    ["@punctuation.special"] = { fg = p.orange },

    ["@tag"] = { fg = p.blue },
    ["@tag.attribute"] = { fg = p.aqua },
    ["@tag.delimiter"] = { fg = p.fg4 },

    ["@markup.heading"] = { fg = p.green, bold = true },
    ["@markup.raw"] = { fg = p.aqua },
    ["@markup.link"] = { fg = p.blue },
    ["@markup.link.url"] = { fg = p.blue, underline = true },
    ["@markup.list"] = { fg = p.orange },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "gruvbox_classic")

return M
