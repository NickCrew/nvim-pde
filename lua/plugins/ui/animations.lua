return {
{
    "RishabhRD/popfix",
  },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    -- Pretty notification windows/popups
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      level = "info",
      stages = "fade_in_slide_out",
      timeout = 1000,
      background_colour = "#2E3440",
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    }
  },
{
    "karb94/neoscroll.nvim",
    lazy = true,
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
