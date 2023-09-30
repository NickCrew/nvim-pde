return {
  {
    "stevearc/oil.nvim",
    config = true,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = 'window-picker',
    event = "VeryLazy",
    version = '2.*',
    config = true
  },
  {
    ---Status bars
    "akinsho/bufferline.nvim",
    config = true,
    enabled = true,
  },
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    lazy = true
  },
  {
    "antoinemadec/FixCursorHold.nvim",
    enabled = true,
  },
  {
    "RishabhRD/popfix",
    enabled = true,
  },
  {
    "MunifTanjim/nui.nvim",
    enabled = true,
  },
  {
    -- Better quickfix window
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = true
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = true
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "telescope.nvim",
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    enabled = true,
    opts = {
      -- routes = {
      --     view = "cmdline",
      --     filter = { event = "msg_showmode"}
      -- },
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
        progress = {
          enabled = true,
          throttle = 1000 / 100,
        },
        signature = {
          enabled = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true,            -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    }
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }
      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end

      local function window_source()
        return vim.api.nvim_win_get_number(0)
      end

      local treesitter_source = function()
        return function()
          local b = vim.api.nvim_get_current_buf()
          if next(vim.treesitter.highlighter.active[b]) then
            return "綠TS"
          end
          return ""
        end
      end

      -- LUALINE CONFIG
      return {
        options = {
          theme = "auto",
          icons_enabled = true,
          disabled_filetypes = {},
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode" } },
          lualine_b = { { "branch", icon = "" } },
          lualine_c = {

            {
              "diff",
              source = diff_source,
              symbols = {
                added = " ",
                modified = "柳",
                removed = " ",
              },
              cond = conditions.hide_in_width,
            },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
            },
          },
          lualine_x = {
            { "aerial" },
            { "filetype",          cond = conditions.buffer_not_empty },
            { "encoding",          cond = conditions.buffer_not_empty },
            { treesitter_source(), cond = conditions.hide_in_width },
          },
          lualine_y = { { "location", icon = "" }, { "progress", icon = "→" }, },
          lualine_z = { { window_source, icon = "" }, { "tabs" }, },
        },
        extensions = {
          "quickfix",
          "aerial",
          "toggleterm",
          "nvim-dap-ui",
          "mundo",
        },
      }
    end
  },
  {
    "arkav/lualine-lsp-progress",
    dependencies = "lualine.nvim",
    enabled = false,
  },

  {
    -- Pretty notification windows/popups
    "rcarriga/nvim-notify",
    enabled = true,
    lazy = true,
    opts = {
      level = "info",
      stages = "fade_in_slide_out",
      timeout = 1500,
      background_colour = "#2E3440",
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    }
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({
        easing_function = "quadratic", -- Default easing function
        -- Set any other options as needed
      })

      local t    = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      -- Use the "sine" easing function
      t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '350', [['sine']] } }
      t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']] } }
      -- Use the "circular" easing function
      t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']] } }
      t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '500', [['circular']] } }
      -- When no easing function is provided the default easing function (in this case "quadratic") will be used
      t['zt']    = { 'zt', { '300' } }
      t['zz']    = { 'zz', { '300' } }
      t['zb']    = { 'zb', { '300' } }

      require('neoscroll.config').set_mappings(t)
    end
  },
  {
    "echasnovski/mini.starter",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VimEnter",
    opts = function()
      local logo = table.concat({
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }, "\n")
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file", "Telescope find_files", "Telescope"),
          new_section("Recent files", "Telescope oldfiles", "Telescope"),
          new_section("Grep text", "Telescope live_grep", "Telescope"),
          new_section("init.lua", "e $MYVIMRC", "Config"),
          new_section("Lazy", "Lazy", "Config"),
          new_section("New file", "ene | startinsert", "Built-in"),
          new_section("Quit", "qa", "Built-in"),
          new_section("Session restore", [[lua require("persistence").load()]], "Session"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  }

}
