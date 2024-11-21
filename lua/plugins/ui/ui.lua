return {
  { 'echasnovski/mini.icons', version = false },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {
      { "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
      { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
      { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
      { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
      { "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse" },
      { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
      { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
      { "<leader>cR", function() Snacks.rename() end,                  desc = "Rename File" },
      { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference" },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      }
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
        end,
      })
    end,
  },
  {
    "OXY2DEV/helpview.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    lazy = true,
    ft = "help",
  },
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
        override      = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        messages      = {
          view_search = true,
        },
        documentation = {
          view = "hover",
        },
        progress      = {
          enabled = true,
          throttle = 1000 / 100,
          format = "lsp_progress",
          view = "mini"
        },
        signature     = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50
          }
        },
        hover         = {
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
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        mini = {
          win_options = {
            winblend = 0
          },
        }
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
