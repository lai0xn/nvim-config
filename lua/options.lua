require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- subtle window separator (append avoids clobbering NvChad's defaults like eob)
vim.opt.fillchars:append({ vert = "│" })
vim.opt.signcolumn = "no"
vim.opt.showtabline = 2
