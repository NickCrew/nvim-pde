local prefs = require("plugins._opts")

return {
  {
    "folke/which-key.nvim",
    enabled = true,
    opts = {
      plugins = {
        marks = true,      -- shows a list of your marks on ' and `
        registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 9, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          g = true,            -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      window = {
        border = "single",         -- none, single, double, shadow
        position = "bottom",       -- bottom, top
        margin = { 1.8, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 },  -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 1, max = 35 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 1,                    -- spacing between columns
        align = "center",               -- align columns left, center or right
      },
      ignore_missing = false,           -- enable this to hide mappings for which you didn't specify a label
      hidden = {
        "<silent>",
        "<cmd>",
        "<Cmd>",
        "<CMD>",
        "<cr>",
        "<CR>",
        "<Cr>",
        "call",
        "<esc>",
        "<ESC>",
        "lua",
        "^:",
        "^ ",
      },                 -- hide mapping boilerplate
      show_help = true,  -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = { "<leader>" }, -- or specify a list manually

      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        n = { "o", "O" },
      },
    }
  },
  
  {
    "folke/noice.nvim",
    dependencies = { {
      "MunifTanjim/nui.nvim"
    },
      {
        "VonHeikemen/fine-cmdline.nvim",
      },
      {
        -- Pretty notification windows/popups
        "rcarriga/nvim-notify",
        opts = {
          level = "warn",
          render = "compact",
          timeout = prefs.notifications.timeout,
          background_colour = "#2E3440",
          icons = {
            ERROR = "",
            WARN  = "",
            INFO  = "",
            DEBUG = "",
          },
        }
      },
    },
    enabled = prefs.notifications.enabled,
    opts = {
      cmdline = {
        enabled = true,
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        messages = { view_search = false },
        progress = {
          enabled = true,
          throttle = 1000 / 100,
          view = "mini"
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
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      routes = {
        { filter = { find = "E162" },                                   view = "mini" },
        { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
        { filter = { event = "msg_show", find = "search hit BOTTOM" },  skip = true },
        { filter = { event = "msg_show", find = "search hit TOP" },     skip = true },
        { filter = { event = "emsg", find = "E23" },                    skip = true },
        { filter = { event = "emsg", find = "E20" },                    skip = true },
        { filter = { find = "No signature help" },                      skip = true },
        { filter = { find = "E37" },                                    skip = true },
      },
    }
  },
  
}
