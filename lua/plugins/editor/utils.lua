return {
  {
      "stevearc/overseer.nvim",
      opts = {},
      lazy = true
  },
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
    -- Smart Session Management
    "folke/persistence.nvim",
    lazy = true,
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
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
