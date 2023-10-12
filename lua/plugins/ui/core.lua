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
    "echasnovski/mini.bufremove",
    config = true
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
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
  
}
