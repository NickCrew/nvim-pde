return {
  {
 'echasnovski/mini.clue',
 version = false ,
   enabled = true,
  lazy= true,
  event = "VeryLazy",
 opts = function()
  local miniclue = require('mini.clue')

local opts = {
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
}
return opts
 end

  },
  {
    "folke/which-key.nvim",
    lazy = true,
    enabled = false,
    event = "VeryLazy",
    keys = {
      { "<C-g>w", mode = "n", "<esc><Cmd>WhichKey<Cr>", desc = "WhichKey" },
    },
    cmd = "WhichKey",
    init = function()
      vim.o.timeoutlen = 300
      vim.o.timeout = true
    end,
    opts = {
      plugins            = {
        marks = true,      -- shows a list of your marks on ' and `
        registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 4, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          g = true,            -- bindings for prefixed with g
          z = true             -- bindings for prefixed with z
        },
      },
      operators          = {
        gc = "Comments"
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      key_labels         = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons              = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      window             = {
        border = "shadow",         -- none, single, double, shadow
        position = "bottom",       -- bottom, top
        margin = { 1.8, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 4, 2, 4 },  -- extra window padding [top, right, bottom, left]
      },
      layout             = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50  }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "left",               -- align columns left, center or right
      },
      motions            = {
        count = true,
      },
      popup_mappings     = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
      },
      ignore_missing     = false, -- enable this to hide mappings for which you didn't specify a label
      hidden             = {
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
      },                -- hide mapping boilerplate
      show_help          = true, -- show help message on the command line when the popup is visible
      show_keys          = true,
      -- --triggers = { "<leader>", "<ctrl-g>", "<ctrl-t>", "\"", "'" }, -- automatically setup triggers
      -- triggers = { "<leader>" }, -- or specify a list manually
      triggers_nowait    = {
        "`",
        "'",
        "g`",
        "g'",
        '"',  -- double quote
        "z=", -- spell correction
        "<c-r>"

      },

      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        n = { "o", "O" },
      },
    }
  },
}
