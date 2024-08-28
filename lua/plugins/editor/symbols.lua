return {
{
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>ol", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },

    },
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    lazy = true,
    config = true,
    enabled = true
  },
  {
    -- LSP Symbol Drawer
    "stevearc/aerial.nvim",
    keys = {
      lazy = true,
      { "<leader><leader>A", mode = "n", "<esc><cmd>AerialToggle<cr>", desc = "Symbols (Aerial)" },
    },
    cmd = { "AerialToggle", "AerialOpen" },
    opts = {
      backends = {
        "lsp",
        "treesitter",
        "markdown",
        "man",
      },
      attach_mode = "window",
      close_automatic_events = {
        "unsupported",
        "switch_buffer",
        "unfocus",
      },
      default_bindings = true,
      layout = {
        default_direction = "prefer_right",
        min_width = 30,
        max_width = 50,
      },
      post_jump_cmd = "normal! zz",
      lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
      },
    }
  },
}
