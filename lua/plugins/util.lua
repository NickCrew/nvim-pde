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
    "williamboman/mason.nvim",
    lazy = true,
    enabled = false,
    build = ":MasonUpdate",
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



}
