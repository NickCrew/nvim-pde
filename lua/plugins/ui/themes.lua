return {
  { 
    "rose-pine/neovim",
    name = "rose-pine"
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
  },
  {
    -- Colorscheme development
    "rktjmp/lush.nvim",
    enabled = false,
  },
}
