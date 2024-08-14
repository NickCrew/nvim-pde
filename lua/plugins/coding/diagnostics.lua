return {
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
}
