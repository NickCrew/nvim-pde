return {
  {
    "rose-pine/neovim",
    lazy = true,
    enabled = false,
    name = "rose-pine",
    priority = 1000,
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
    enabled = false,
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    -- Colorscheme development
    "rktjmp/lush.nvim",
    enabled = false,
  },
}
