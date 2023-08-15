return {
  {
    -- Quick movements
    "phaazon/hop.nvim",
    branch = 'v2',
    config = function()
      require("hop").setup({
        case_insensitive = true
      })
      require("keymaps.hop_keys")
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = ""},
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    enabled = false
    },

    {
      -- Code refactoring
      "ThePrimeagen/refactoring.nvim",
      dependencies = "telescope.nvim",
      lazy = true,
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
      enabled = true,
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
      enabled = true,
      lazy = true,
      config = function()
        require("config.copilot")
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
      lazy = true,
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
        require("keymaps.wk")
      end,
    },
    {
      -- Schemas
      "b0o/schemastore.nvim",
      enabled = true,
    },
 }
}
