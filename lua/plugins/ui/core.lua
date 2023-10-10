return {
{
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = true
  },
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
  {
    -- Better quickfix window
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = true
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
  
}
