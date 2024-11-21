return {
  {
  "hedyhli/outline.nvim",
  lazy = true,
  event = "BufRead",
  cmd = "Outline",
  opts = {},
  keys = {
    { "<leader>o", mode = "n", "<cmd>Outline<cr>", desc = "Outline" },
  }
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
