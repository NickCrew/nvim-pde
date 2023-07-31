return {
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
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      -- require("telescope").load_extension("yaml_schema")
    end,
  },
  {
    "mfussenegger/nvim-ansible"
  },

  {
    -- Popup preview window for LSP
    "rmagatti/goto-preview",
    event = "BufEnter",
    config = function()
      require("config.gotopreview")
    end,
  },
{
    -- Lua development tools
    "folke/lua-dev.nvim",
    lazy = true,
  },




}
