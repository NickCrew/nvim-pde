local prefs = require("plugins.prefs")

return {
  {
    "RishabhRD/popfix",
  },
  {
    "folke/noice.nvim", dependencies = { {
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
        bottom_search = false,         -- use a classic bottom cmdline for search
        command_palette = true,      -- position the cmdline and popupmenu together
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
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    lazy = true,
    config = true
  },
  {
    "stevearc/dressing.nvim",
    opts = {}
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    keys = {
      { "<leader><leader>t", "<cmd>Twilight<cr>", desc = "Twilight" }
    },
    config = true
  },
    { -- HIghlight TODO comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },
}
