return {
  {
    -- clipboard history
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "tami5/sqlite.lua",             module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("config.neoclip")
      require("telescope").load_extension("neoclip")
    end,
    enabled = false
  },
  { 
  "mfussenegger/nvim-treehopper",
  dependencies = {
    "phaazon/hop.nvim"
  }
},
  {
    -- Syntax-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },

  {
    -- Smart delimiters and pairs
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  },
  {
    -- Docstring generator
    "danymat/neogen",
    cmd = "Neogen",
    lazy = true,
    config = function()
      require("config.neogen")
    end,
  },
  {
    -- Completion and Snippets
    "hrsh7th/nvim-cmp",
    dependencies = {
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "lukas-reineke/cmp-rg",
      "onsails/lspkind-nvim",
      "petertriho/cmp-git",
      "ray-x/cmp-treesitter",
      "rcarriga/cmp-dap",
      "saadparwaiz1/cmp_luasnip",
    "zbirenbaum/copilot-cmp",
    "zbirenbaum/copilot.lua",
    },
    config = function()
      require("config.completion")
    end,
  },

  {
    -- Lua-based snippet engine
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("config.snippets")
    end,
  },

  {
    -- Find luasnip snippets using telescope
    "benfowler/telescope-luasnip.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "L3MON4D3/LuaSnip",
    },
  },
}
