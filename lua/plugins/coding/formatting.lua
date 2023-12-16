-- Auto-formatting and linting
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
          "neo-tree", "lua", "quickfix", "loclist", "telescope"
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
    "mhartington/formatter.nvim",
    lazy = true,
    enabled = false
  },
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    enabled = false
  },
  {
    -- Schemas
    "b0o/schemastore.nvim",
    lazy = true,
    enabled = true,
    ft = { "yaml", "json" },
  },

}
