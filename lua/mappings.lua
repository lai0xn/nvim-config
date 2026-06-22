require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- neo-tree overrides (nvim-tree.lua is disabled)
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "neo-tree toggle" })
map("n", "<leader>e", "<cmd>Neotree focus<CR>", { desc = "neo-tree focus" })

-- native tab management
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "tab new" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "tab close" })
map("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "tab only" })
map("n", "<leader>t[", "<cmd>tabprevious<CR>", { desc = "tab previous" })
map("n", "<leader>t]", "<cmd>tabnext<CR>", { desc = "tab next" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
