return {
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
}
