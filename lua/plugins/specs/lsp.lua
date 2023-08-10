return {
  {
    "folke/neoconf.nvim",
    lazy = true,
    opts = {}
  },
  {
    "folke/neodev.nvim",
    lazy = true,
    opts = {}
  },
  {
    "arkav/lualine-lsp-progress",
    dependencies = "lualine.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
      "weilbith/nvim-code-action-menu",
      "ray-x/lsp_signature.nvim",
      "simrat39/rust-tools.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "folke/lsp-colors.nvim",
      "nvim-lua/lsp-status.nvim",
      "kosayoda/nvim-lightbulb",
      "williamboman/nvim-lsp-installer",
    },
    event = "BufEnter",
    config = function()
      require("config.lsp")
    end,
  },
  {
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    dependencies = "telescope.nvim",
    lazy = true,
    config = function()
      require("config.trouble")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "javascript",
      -- "python",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      -- "json",
      "markdown",
      "lua",
    },
    config = function()
      require("config.null_ls")
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    lazy = true
  },
  {
    -- LSP Symbol Drawer
    "stevearc/aerial.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("config.aerial")
      require("telescope").load_extension("aerial")
    end,
  },

  {
    -- Popup preview window for LSP
    "rmagatti/goto-preview",
    event = "BufEnter",
    lazy = true,
    config = function()
      require("config.gotopreview")
    end,
  },

}
