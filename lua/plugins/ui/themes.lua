return {
  { 
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = false
      })
      vim.cmd([[colorscheme rose-pine-moon]])
    end
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end
  },
  {
    -- Colorscheme development
    "rktjmp/lush.nvim",
    enabled = false,
  },
}
