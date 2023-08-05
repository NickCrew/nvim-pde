return {
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require('telescope').load_extension('dap')
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "tami5/sqlite.lua",
    },
    config = function()
      require("config.telescope-nvim")
    end,
  },
  {
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    lazy = true,
    event = "TermOpen",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("toggleterm")
    end,
  },
  {
    "LinArcX/telescope-env.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "jvgrootveld/telescope-zoxide",
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-live-grep-raw.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-node-modules.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      local telescope = require('telescope')
      telescope.load_extension("env")
      telescope.load_extension("zoxide")
      telescope.load_extension("ui-select")
      telescope.load_extension("file_browser")
      telescope.load_extension("media_files")
      telescope.load_extension("luasnip")
      telescope.load_extension("refactoring")
      telescope.load_extension("node_modules")
    end
  }
}
