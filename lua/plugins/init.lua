return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "andweeb/presence.nvim",
    config=function()
      require("configs.discord")
    end,
    lazy=false
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
  "neovim/nvim-lspconfig",
  config = function()
  require("nvchad.configs.lspconfig").defaults()
  require "configs.lspconfig"
   end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
  "williamboman/mason.nvim",
  opts = {
  ensure_installed = {
  "lua-language-server", "stylua",
  "html-lsp", "css-lsp" , "prettier","gofumpt",
    "gopls","zls",
  },
  },
  },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
