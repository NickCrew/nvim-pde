return {
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    enabled = false,
    lazy = true,
    config = true
  },
  { "lifepillar/vim-gruvbox8", enabled  = false},
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    lazy = true,
  },
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    lazy = false

  },
  {
    -- colorscheme development
    "rktjmp/lush.nvim",
    enabled = true,
    lazy = true,
    cmd = "Lushify",

  },
  {
    "arcticicestudio/nord-vim",
    enabled = false
},
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          functions = "italic,bold",
        },
      }

    }
  },
  {
    "scottmckendry/cyberdream.nvim",
    enabled = false,
    lazy = false,
    opts = {
      -- recommended - see "configuring" below for more config options
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
    },
  },
  {
    "rose-pine/neovim",
    lazy = false,
    enabled = false,
    name = "rose-pine",
    opts = {
      disable_background = false,
      variant = 'auto',
      dark_variant = 'moon',
    },
  },
  {
    "shatur/neovim-ayu",
    enabled = false,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    lazy = true,
    name = "catppucin",
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    opts = { style = "moon" }
  },


}
