return {
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true,       -- #RGB hex codes
        RRGGBB = true,    -- #RRGGBB hex codes
        names = false,    -- "Name" codes like Blue
        RRGGBBAA = true,  -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true,    -- CSS rgb() and rgba() functions
        hsl_fn = true,    -- CSS hsl() and hsla() functions
        css = false,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {}
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/zen-mode.nvim",
    lazy = true,
    event = "BufReadPre",
    config = true,
    dependencies = {
      "folke/twilight.nvim",
      lazy = true,
      cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
      keys = {
        { "<leader><leader>t", "<cmd>Twilight<cr>", desc = "Twilight" }
      },
      opts = {
        context = 20,
      }
    },
  },

  {
    "echasnovski/mini.icons",
    lazy = true,
    event = "VeryLazy",
    version = "*"

},
  { -- HIghlight TODO comments
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
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
        documentation  = {
          view = "hover",
        },
        progress = {
          enabled = true,
          throttle = 1000 / 100,
          format = "lsp_progress",
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
    "MunifTanjim/nui.nvim",
    lazy = true,
    event = "VeryLazy"
  },
  {
    -- Pretty notification windows/popups
    "rcarriga/nvim-notify",
    lazy = true,
    cmd = { "Notifications" },
    keys = {

      { "<leader>nn", mode = "n", "<esc><cmd>Notifications<cr>", desc = "All Notifications", },
    },
    opts = {
      level = "info",
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 5000,
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
      },
    }
  },


}
