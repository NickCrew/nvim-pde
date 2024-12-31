return {
  {
    'willothy/wezterm.nvim',
    lazy = true,
    enabled = true,
    config = true
  },
  { -- Language-aware commenting
    "tpope/vim-commentary",
    lazy = true,
    event = "BufReadPre",
    enabled = true,
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = "ToggleTerm",
    version = "*",
    config = true
  },
  {
    -- VS Code remote container support
    "chipsenkbeil/distant.nvim",
    lazy = true,
    Enabled = false,
  },
  {
    -- VS Code container development support
    "esensar/nvim-dev-container",
    lazy = true,
    enabled = false,
  },
  {
    'rmagatti/auto-session',
    enabled = false,
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },

}
