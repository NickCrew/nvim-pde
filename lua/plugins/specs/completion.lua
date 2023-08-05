return {
  {
    -- Completion and Snippets
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- "zbirenbaum/copilot-cmp",
      -- "zbirenbaum/copilot.lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "rcarriga/cmp-dap",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
      "ray-x/cmp-treesitter",
      "onsails/lspkind-nvim",
      "f3fora/cmp-spell",
      "lukas-reineke/cmp-rg",
      "petertriho/cmp-git",
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
