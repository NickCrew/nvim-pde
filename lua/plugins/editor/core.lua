return {
{
    -- Smart Session Management
    "folke/persistence.nvim",
    lazy = true,
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
  },
  {
    "folke/neoconf.nvim",
    lazy = true,
    config = true,
    enabled = false
  },
  {
    "echasnovski/mini.bufremove",
    config = true
  },
  {
    'echasnovski/mini.bracketed',
    version = false
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    enabled = true,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gza",            -- Add surrounding in Normal and Visual modes
        delete = "gzd",         -- Delete surrounding
        find = "gzf",           -- Find surrounding (to the right)
        find_left = "gzF",      -- Find surrounding (to the left)
        highlight = "gzh",      -- Highlight surrounding
        replace = "gzr",        -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
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
      operators = { gc = "Comments" },
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
        border = "shadow",         -- none, single, double, shadow
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
        "<CR>",
        "call",
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
  { -- Language-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },
  {
    'willothy/wezterm.nvim',
    config = true
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = 'window-picker',
    event = "VeryLazy",
    version = '2.*',
    config = true
  },
  {
    "antoinemadec/FixCursorHold.nvim",
  },
}
