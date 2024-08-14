return {
  {
    "s1n7ax/nvim-window-picker",
    name = 'window-picker',
    event = "VeryLazy",
    version = '2.*',
    config = true
  },
  {
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble" },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {
      modes = {
        test = {
          mode = "diagnostics",
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.3
          }
        }
      }
    }
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    enabled = true,
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
      local utils = require("settings.utils")
    end,
    keys = {
      -- increase width
      ["<c-s-Right>"] = function(win)
        win:resize("width", 2)
      end,
      -- decrease width
      ["<c-s-Left>"] = function(win)
        win:resize("width", -2)
      end,
      -- increase height
      ["<c-s-Up>"] = function(win)
        win:resize("height", 2)
      end,
      -- decrease height
      ["<c-s-Down>"] = function(win)
        win:resize("height", -2)
      end,
    },
    opts = {
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          size = { height = 0.4 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        {
          title = "Problems",
          ft = "trouble",
        },
        {
          ft = "qf",
          title = "QuickFix"
        },
        {
          ft = "help",
          title = "Help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        {
          ft = "spectre_panel",
          size = { height = 0.4 },
          title = "Search/Replace"
        },
      },
      left = {
        {
          title = "Explorer",
          ft = "neo-tree",
          open = "Neotree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.3 },
        },
        {
          ft = "Outline",
          title = "Outline",
          pinned = true,
          size = { height = 0.3 },
          open = "SymbolsOutlineOpen",
        },
        {
          title = "Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },

        {
          title = "Changes",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = false,
          open = "Neotree position=right git_status",
        },
        -- any other neo-tree windows
        "neo-tree",
      },
      right = {
        {
          ft = "copilot-chat",
          title = "Copilot Chat",
          size = { width = 50 },
        },
        {
          title = "Grug Far",
          ft = "grug-far",
          size = { width = 0.4 }
        }
      }
    },
  }

}
