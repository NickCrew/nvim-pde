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
  }
}
