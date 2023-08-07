return {
  {
    -- Syntax-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },

  {
    -- Better undo control
    "simnalamburt/vim-mundo",
    enabled = true,
  },
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
    -- Smart delimiters and pairs
    "windwp/nvim-autopairs",
    config = function()
      require("config.autopairs")
    end,
  },

  {
    -- Smart Session Management
    "folke/persistence.nvim",
    lazy = true,
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
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
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    dependencies = "telescope.nvim",
    config = function()
      require("refactoring").setup()
      require("telescope").load_extension("refactoring")
    end,
  },


  {
    -- AI chatbot
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    enabled = false,
    lazy = true,
    cmd = "ChatGPT",
    config = function()
      require("chatgpt").setup({})
    end,
  },
  {
    -- AI code completion
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    enabled = false,
    lazy = true,
    config = function()
      require("config.copilot")
    end,
  },

  {
    -- save useful cheatsheets
    "sudormrfbin/cheatsheet.nvim",
    lazy = true,
    cmd = "Cheatsheet",
    dependencies = { "telescope.nvim" },
    config = function()
      require("cheatsheet").setup()
      require("telescope").load_extension("cheatsheet")
    end,
  },

  {
    -- Project manager
    "ahmedkhalf/project.nvim",
    enabled = true,
    config = function()
      require("config.project")
      require("telescope").load_extension("projects")
    end,
  },
{
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    dependencies = "telescope.nvim",
    config = function()
      require("config.harpoon")
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    lazy = true,
    branch = "main",
    config = function()
      require("config.toggle-term")
    end,
  },

  {
    "mrjones2014/legendary.nvim",
    dependencies = "which-key.nvim",
    lazy = true,
    enabled = false,
    config = function()
      require("legendary").setup({
        which_key = {
          auto_register = true,
        },
      })
    end,
  },

  {
    "folke/which-key.nvim",
    enabled = true,
    config = function()
      require("config.which-key-nvim")
    end,
  },

  {
    -- Schemas
    "b0o/schemastore.nvim",
    enabled = true,
  },


}
