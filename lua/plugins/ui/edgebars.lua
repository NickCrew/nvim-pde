return {
  {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    enabled = true,
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim",

    },
    keys = {
      { "<leader>nd", mode = "n", "<esc><cmd>NoiceDismiss<cr>", desc = "Dismiss Notifications", },
      { "<leader>ne", mode = "n", "<esc><cmd>NoiceErrors<cr>",  desc = "Error Notifications", },
      { "<leader>nh", mode = "n", "<esc><cmd>NoiceHistory<cr>", desc = "Old Notification", },
    },
    opts = {
      cmdline = {
        enabled = true,

      },
      popupmenu = {
        enabled = true,
        backend = "cmp"

      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        messages = {
          view_search = true,
        },
        progress = {
          enabled = true,
          throttle = 1000 / 100,
          format = "lsp_progress"
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50
          }
        },
        hover = {
          enabled = true,
          silent = false,
        }
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = false,      -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      routes = {
        { filter = { find = "E21" },                                   skip = true },

        { filter = { find = "E162" },                                  skip = true },
        --{ filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
        { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
        { filter = { event = "msg_show", find = "search hit TOP" },    skip = true },
        { filter = { event = "emsg", find = "E23" },                   skip = true },
        { filter = { event = "emsg", find = "E20" },                   skip = true },
        { filter = { find = "No signature help" },                     skip = true },
        { filter = { find = "E37" },                                   skip = true },
      },
    }
  },
  {
    "folke/edgy.nvim",
    lazy = true,
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
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
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        {
          ft = "qf",
          title = "QuickFix"
        },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        {
          title = "Search & Replace",
          ft = "spectre_panel",
          size = { height = 0.4 }
        },
      },
      right = {
        title = "Aerial",
        open = "AerialOpen",
        ft = "aerial",
        size = { width = 40 }
        ,
        left = {
          -- Neo-tree filesystem always takes half the screen height
          {
            title = "Explorer",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end,
            size = { height = 0.3 },
          },
          {
            ft = "Outline",
            pinned = true,
            open = "SymbolsOutlineOpen",
            size = { width = 40, height = 0.3 },
          },
          {
            title = "Git Status",
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
          -- any other neo-tree windows
          "neo-tree",
        },
      },
    }
  } }
