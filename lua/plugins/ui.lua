return {
  {
    'folke/tokyonight.nvim',
    priority = 1000
  },
  {
    -- Colorscheme development
    "rktjmp/lush.nvim",
    enabled = false,
  },


  {
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
    ---Status bars
    "akinsho/bufferline.nvim",
    config = true,
    enabled = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lualine")
    end,
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
    config = function()
      require("config.dashboard")
    end,
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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  }
}
