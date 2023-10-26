return {
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    lazy = true
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = true
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
}
