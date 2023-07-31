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
    "ggandor/flit.nvim",
    config = function()
      require("flit").setup({
        multiline = false,
      })
    end,
  },

  {
    -- Sneak/quick movements
    "ggandor/leap.nvim",
    dependencies = "tpope/vim-repeat",
    config = function()
      require("leap").set_default_keymaps()
    end,
  },
}
