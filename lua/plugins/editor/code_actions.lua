return { 
  {
    "kosayoda/nvim-lightbulb",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
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
  { -- Language-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },
  {
    "kosayoda/nvim-lightbulb",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
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
}
