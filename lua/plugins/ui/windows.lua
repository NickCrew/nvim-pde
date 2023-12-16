local prefs = require("plugins.prefs")
return {

  {
    "folke/edgy.nvim",
    lazy = true,
    enaled = prefs.sidebar.enabled,
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    keys = {
      {
        "<leader>ee",
        function()
          require("edgy").toggle()
        end,
        desc = "Edgy Toggle",
      },
    },
    opts = function()
      return {
        keys = {
          -- increase width
          ["<M-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<M-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<M-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<M-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
        bottom = {
          -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
          {
            title = "Terminal",
            ft = "toggleterm",
            size = { height = 0.4 },
            -- exclude floating windows
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
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
          {"Trouble", title = "Problems"},
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- only show help buffers
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          {
            title = "Find & Replace",
            ft = "spectre_panel",
            size = { height = 0.4 }
          },
        },
        left = {
          {
            title = "Browse",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end,
            size = { height = 0.4 },
          },
          {
            title = "Source Control",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "git_status"
            end,
            pinned = true,
            open = "Neotree position=right git_status",
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
            ft = "Outline",
            pinned = true,
            open = "SymbolsOutline",
          },
          -- any other neo-tree windows
          "neo-tree",
        },
      }
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" }
    },
    cmd = {"SymbolsOutline", "SymbolsOutlineOpen"},
    lazy = true,
    config = true
  },
  -- amongst your other plugins
  {
    'akinsho/toggleterm.nvim',
    cmd = "ToggleTerm",
    version = "*",
    config = true
  },
}
