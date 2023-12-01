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
    enabled = false,
    lazy = true,
  },
  {
    "mfussenegger/nvim-lint",
    lazy = true
  },
  {
    -- Schemas
    "b0o/schemastore.nvim",
    lazy = true,
    enabled = true,
    ft = { "yaml", "json" },
  },

}
