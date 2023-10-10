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
      timeout = 1500,
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
}
