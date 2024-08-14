return {
  {
    "folke/which-key.nvim",
    lazy = true,
    enabled = true,
    event = "VeryLazy",
    keys = {
      { "<leader><leader>w", mode = "n", "<esc><Cmd>WhichKey<Cr>", desc = "WhichKey" },
    },
    cmd = "WhichKey",
    init = function()
      vim.o.timeoutlen = 300
      vim.o.timeout = true
    end,
  },
}
