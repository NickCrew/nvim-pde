return {
  { -- HIghlight TODO comments
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    keys = {
      { "<C-g><C-h>", mode = "n", "<esc><cmd>Spectre<cr>", desc = "Search and Replace" },
    },
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
  },

  {
    "kosayoda/nvim-lightbulb",
    enabled = false,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      float = {
        enabled = true,
        text = "💡",
        win_opts = {
          winblend = 100,
          border = "none",
        },
      },
      status_text = {
        enabled = true
      },
      autocmd = {
        enabled = true
      },
      ignore = {
        ft = {
          "neo-tree", "lua", "quickfix", "loclist", "telescope", "help"
        }
      }
    },
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    enabled = false,
    lazy = true
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    lazy = true,
    opts = {},
    enabled = true,
  },
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    lazy = true,
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
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    enabled = true,
    keys = {
      -- stylua:ignore
      { "e", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Function"},
      { "f", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract Function To File"},
      { "v", mode = { "v" }, " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable"},
      {"i", mode = { "v" }," <Esc><Cmd>lua require('refactoring').refactor('Extract Inline Variable')<CR>", desc = "Extract Inline Variable"},
      -- stylua:ignore end
    },
    config = true
  },

  { -- Language-aware commenting
    "tpope/vim-commentary",
    lazy = true,
    event = "BufReadPre",
    enabled = true,
  },
}
