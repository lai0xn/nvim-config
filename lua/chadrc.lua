-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "inuyasha_gold",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
	hl_override = {
		WinSeparator = { fg = "grey" },
		WindowPickerStatusLine = { link = "StatusLine" },
		WindowPickerStatusLineNC = { link = "StatusLineNC" },
		WindowPickerWinBar = { link = "WinBar" },
		WindowPickerWinBarNC = { link = "WinBarNC" },
	},
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    enabled = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
  },
}

return M
