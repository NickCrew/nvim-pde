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
      -- Go to last focused main window
      ["<leader>em"] = function()
        require("edgy").goto_main()
      end,
      -- Select window
      ["<leader>ew"] = function()
        require("edgy").select()
      end,
      -- Close all windows except current
      ["<leader>ex"] = function()
        require("edgy").close()
      end,
      -- Open all windows
      ["<leader>eo"] = function()
        require("edgy").open()
      end,
      -- Toggle pinned windows
      ["<leader>ep"] = function()
        require("edgy").toggle()
      end,
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
      options = {
        left = {
          width = 50,
        },
      },
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          ft = "toggleterm",
          title  = "Terminal",
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
          title = "Issues",
          ft = "trouble",
          size = { height = 0.3 }
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
      },
      left = {
        {
          title = "Explorer",
          ft = "neo-tree",
          open = "Neotree",
          pinned  = true,
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { width = 40 , height = 0.30},
        },
        {
          ft = "Outline",
          title = "Outline",
          pinned = true,
          size = { height = 0.30  , width = 40 },
          open = "SymbolsOutlineOpen",
        },
        {
          title = "Buffers",
          ft = "neo-tree",
          size = { width = 40, height = 0.20 },
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
          pinned = true,
          open = "Neotree position=right git_status",
          size = { height = 0.20 },
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
