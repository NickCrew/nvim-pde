return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "stevearc/oil.nvim",
    config = true,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
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
    "s1n7ax/nvim-window-picker",
    name = 'window-picker',
    event = "VeryLazy",
    version = '2.*',
    config = true
  },
  {
    "antoinemadec/FixCursorHold.nvim",
  },
  {
    -- VS Code remote container support
    "chipsenkbeil/distant.nvim",
    lazy = true,
    enabled = false,
  },
  {
    -- Support for VS Code's task.json
    "EthanJWright/vs-tasks.nvim",
    lazy = true,
    enabled = true,
  },

  {
    -- VS Code container development support
    "esensar/nvim-dev-container",
    lazy = true,
    enabled = false,
  },
  {
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    keys = {
      {
        "e",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        desc =
        "Extract Function"
      },
      {
        "f",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        desc =
        "Extract Function To File"
      },
      {
        "v",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        desc =
        "Extract Variable"
      },
      {
        "i",
        mode = { "v" },
        " <Esc><Cmd>lua require('refactoring').refactor('Extract Inline Variable')<CR>",
        desc =
        "Extract Inline Variable"
      },
    },
    config = true
  },
}
