return {
{
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-macciato]])
    end
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    enabled = true,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    -- Colorscheme development
    "rktjmp/lush.nvim",
    enabled = false,
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
    -- Smooth Scrolling
    "karb94/neoscroll.nvim",
    enabled = true,
    config = function()
      require("neoscroll").setup({
        easing_function = "quadratic",
      })
    end,
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
    -- Splash Screen/Dashboard
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local btn_opts = {}
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }

      dashboard.section.buttons.val =
      {
        dashboard.button("f f", "  > Find File", ":Telescope find_files<CR>", btn_opts),
        dashboard.button("f p", "  > Find Project", ":Telescope projects<CR>", btn_opts),
        dashboard.button("z d", "  > File Browser", ":Telescope file_browser<CR>", btn_opts),
        dashboard.button("f g", "  > Search in Files", ":Telescope live_grep<CR>", btn_opts),
        dashboard.button("u", "  > Sync plugins", ":Lazy sync<CR>", btn_opts),
        dashboard.button("e", "  > New file", ":enew <CR>", btn_opts),
        dashboard.button("q", "  > Quit NVIM", ":qa<CR>", btn_opts),
      }

      dashboard.section.footer.val = require('alpha.fortune')
      return dashboard.opts
    end
  } 
  
}
