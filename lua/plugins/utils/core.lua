return {
  {
    "RishabhRD/popfix",
  },
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    lazy = true,
    config = true
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    keys = {
      { "<leader><leader>t", "<cmd>Twilight<cr>", desc = "Twilight" }
    },
    config = true
  },
  { -- HIghlight TODO comments
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true
  },
  { -- highlight color codes
    "norcalli/nvim-colorizer.lua",
    enabled = false
  },
  {
    'willothy/wezterm.nvim',
    config = true
  },
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
