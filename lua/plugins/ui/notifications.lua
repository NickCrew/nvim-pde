return {
  {
    "VonHeikemen/fine-cmdline.nvim",
    event = 'CmdlineEnter',
    lazy = true,
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
    event = "VeryLazy"
  },
  {
    -- Pretty notification windows/popups
    "rcarriga/nvim-notify",
    lazy = true,
    cmd = {"Notifications"},
    keys = {

      { "<leader>nn", mode = "n", "<esc><cmd>Notifications<cr>", desc = "All Notifications", },
    },
    opts = {
      level = "info",
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 5000,
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
      },
    }
  },

  
}
