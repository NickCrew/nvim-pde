return {
  {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "tami5/sqlite.lua",
      "nvim-telescope/telescope-dap.nvim",
    { 
      "nvim-telescope/telescope-fzf-native.nvim", 
      build = "make"
    },
    "LinArcX/telescope-env.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-live-grep-raw.nvim",
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-ui-select.nvim",

    },
    config = function()
        require("config.telescope-nvim")
    end,
  }
  }
