return {
  {
    "rose-pine/neovim",
    lazy = true,
    enabled = true,
    name = "rose-pine",
    opts = {
      disable_background = false,
      variant = 'auto',
      dark_variant = 'moon',
    },
  },
  {
    "Shatur/neovim-ayu",
    enabled = false,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = true,
    name = "catppuccin",
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = { style = "moon" }
  },
  {
    -- Colorscheme development
    "rktjmp/lush.nvim",
    enabled = false,
  },
}
