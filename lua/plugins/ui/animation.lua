return {
  {
    'echasnovski/mini.animate', version = false,
    enabled = true,
    event = "VeryLazy",
    lazy = true,
  },
  {
    "karb94/neoscroll.nvim",
    enabled = true,
    lazy =  true,
    event = "VeryLazy",
    opts = {
      easing_funtion = "sine",
      mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = true,
      cursor_scrolls_alone = true,
    },
  },
}
