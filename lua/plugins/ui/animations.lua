return {
  {
    'echasnovski/mini.animate', version = false
  },
  {
    "karb94/neoscroll.nvim",
    lazy = true,
    enabled = true,
    opts = {
      easing_funtion = "sine",
      mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    },
  },
}
