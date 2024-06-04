return {
{
    "s1n7ax/nvim-window-picker",
    name = 'window-picker',
    event = "VeryLazy",
    version = '2.*',
    config = true
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    enabled = true,
    lazy = true,
    cmd = {"Neotree"},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
    "<C-g>t", function()
      require("neo-tree.command").execute({ toggle = true })
    end,
      desc = "Toggle NeoTree",
      },
      {
        "<leader>er",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>ec",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true, position = "float"})
        end,
        desc = "Buffer explorer",
      },
    },
  },
{
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    lazy = true,
    cmd = {"Trouble"},
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
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
      { "<C-g>o",     "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" }

    },
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    lazy = true,
    config = true,
    enabled = true
  },
  {
    -- LSP Symbol Drawer
    "stevearc/aerial.nvim",
    keys = {
      lazy = true,
      { "<C-g>a", mode = "n", "<esc><cmd>AerialToggle<cr>", desc = "Symbols (Aerial)" },
    },
    cmd = { "AerialToggle", "AerialOpen" },
    opts = {
      backends = {
        "lsp",
        "treesitter",
        "markdown",
        "man",
      },
      attach_mode = "window",
      close_automatic_events = {
        "unsupported",
        "switch_buffer",
        "unfocus",
      },
      default_bindings = true,
      layout = {
        default_direction = "prefer_right",
        min_width = 30,
        max_width = 50,
      },
      post_jump_cmd = "normal! zz",
      lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
      },
    }
  },
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
  event = "VeryLazy",
  enabled = true,
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
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
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.5 },
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = true,
        open = "Neotree position=right git_status",
      },
      {
        title = "Neo-Tree Buffers",
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
        open = "SymbolsOutlineOpen",
      },
      -- any other neo-tree windows
      "neo-tree",
    },
  },
}
  
}
