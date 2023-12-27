return {
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    keys = {
      { "<leader><leader>t", "<cmd>Twilight<cr>", desc = "Twilight" }
    },
    config = true
  },
}
