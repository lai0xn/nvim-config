return {
  -- disable default nvim-tree.lua in favor of neo-tree
  { "nvim-tree/nvim-tree.lua", enabled = false },

  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    opts = {
      hint = "statusline-winbar",
      selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      filter_rules = {
        autoselect_one = true,
        include_current_win = false,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify", "snacks_notif" },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },

  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      main_image = "file",
      show_time = true,
      enable_line_number = false,
      buttons = false,
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
    },
  },

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<CR>", desc = "open parent directory" },
      { "<leader>o", "<cmd>Oil<CR>", desc = "oil file explorer" },
    },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
    cmd = "Neotree",
    keys = {
      { "<C-n>", "<cmd>Neotree toggle<CR>", desc = "neo-tree toggle" },
      { "<leader>e", "<cmd>Neotree focus<CR>", desc = "neo-tree focus" },
    },
    opts = function()
      local function pickable_windows()
        local windows = {}

        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local config = vim.api.nvim_win_get_config(win)
          local buf = vim.api.nvim_win_get_buf(win)
          local bo = vim.bo[buf]

          if config.relative == ""
            and bo.filetype ~= "neo-tree"
            and bo.filetype ~= "neo-tree-popup"
            and bo.filetype ~= "notify"
            and bo.filetype ~= "snacks_notif"
            and bo.buftype ~= "terminal"
            and bo.buftype ~= "quickfix"
          then
            table.insert(windows, win)
          end
        end

        return windows
      end

      return {
        sources = { "filesystem", "buffers", "git_status" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "qf" },
        filesystem = {
          bind_to_cwd = true,
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          commands = {
            smart_open = function(state)
              local commands = require "neo-tree.sources.filesystem.commands"

              if #pickable_windows() > 1 then
                commands.open_with_window_picker(state)
              else
                commands.open(state)
              end
            end,
          },
          window = {
            mappings = {
              ["<cr>"] = "smart_open",
            },
          },
        },
        window = {
          mappings = {
            ["<C-n>"] = "close_window",
          },
        },
      }
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon"):setup {
        default = {
          sync_on_ui_close = true,
        },
      }
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():append()
        end,
        desc = "harpoon add file",
      },
      {
        "<leader>hh",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon menu",
      },
      {
        "<leader>hn",
        function()
          require("harpoon"):list():next()
        end,
        desc = "harpoon next",
      },
      {
        "<leader>hp",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "harpoon prev",
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon file 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon file 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon file 3",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon file 4",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

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
