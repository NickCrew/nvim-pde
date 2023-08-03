return {
{
    ---Status bars
    "akinsho/bufferline.nvim",
    config = function()
      require('bufferline').setup({})
    end,
    enabled = true,
  },
  {
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    dependencies = "telescope.nvim",
    config = function()
      require("config.harpoon")
      require("telescope").load_extension("harpoon")
    end,
  },

  {
    -- Project Drawer
    "lambdalisue/fern.vim",
    dependencies = {
      "yuki-yano/fern-preview.vim",
      "lambdalisue/fern-hijack.vim",
      "lambdalisue/fern-mapping-quickfix.vim",
      "lambdalisue/nerdfont.vim",
      "lambdalisue/glyph-palette.vim",
      "lambdalisue/fern-renderer-nerdfont.vim",
      "lambdalisue/fern-git-status.vim",
      "lambdalisue/fern-bookmark.vim",
    },
  },
}
