--[[
Group: Editor Enhancements

Plugins:
 - vim-commentary
 - refactoring
 - hop
 - flash
 - telescope
 - harpoon
 - toggleterm
 - legendary
 - which-key

--]]
return {
  {
    'echasnovski/mini.bracketed',
    version = false
  },
  {
    -- Syntax-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },
  {
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    config = function()
      require("refactoring").setup()
      require("telescope").load_extension("refactoring")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    lazy = true,
    branch = "main",
    opts = {
      on_config_done = nil,
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 3,     -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell,  -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = "curved",
        width = 120,
        height = 30,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
  },
  {
    "mrjones2014/legendary.nvim",
    lazy = true,
    enabled = true,
    opts = {
      which_key = {
        auto_register = true
      }
    }
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
  {
    -- Smart Session Management
    "folke/persistence.nvim",
    lazy = true,
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
  }
}
