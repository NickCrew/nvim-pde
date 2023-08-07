return {
  {
    -- Move lines and selections up and down
    "matze/vim-move",
    enabled = true,
  },
  {
    -- More useful word motions
    "chaoren/vim-wordmotion",
    enabled = true,
  },
  {
    -- Quick movements
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({
        case_insensitive = true,
        char2_fallback_key = "<CR>",
      })
    end,
  },
{
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
}
