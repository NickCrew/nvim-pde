return {
  {
    -- macos system dark/mode
    "vimpostor/vim-lumen",
    enabled = false,
    lazy = true,
    config = true
  },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    lazy = true

  },
  {
    -- colorscheme development
    "rktjmp/lush.nvim",
    enabled = true,
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = true,
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
    "shatur/neovim-ayu",
    enabled = true,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    enabled = true,
    lazy = true,
    name = "catppucin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    opts = { style = "moon" }
  },


}
