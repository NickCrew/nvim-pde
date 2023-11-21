return {
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    lazy = true,
    config = true
  },
  {
    "stevearc/dressing.nvim",
    opts = {}
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    keys = {
      {"<leader><leader>t", "<cmd>Twilight<cr>", desc = "Twilight"}
    },
    config = true
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
}
