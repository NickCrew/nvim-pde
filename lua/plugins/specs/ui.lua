return {
  {
    "vimpostor/vim-lumen",
    lazy = true
  },
  {
    "antoinemadec/FixCursorHold.nvim",
    enabled = true,
  },
  {
    "RishabhRD/popfix",
    enabled = true,
  },
  {
    "MunifTanjim/nui.nvim",
    enabled = true,
  },
  {
    -- Full transparency
    "xiyaowong/transparent.nvim",
    lazy = true,
    enabled = false,
  },
  {
    -- Extend % operator
    "andymass/vim-matchup",
    enabled = true,
  },

  {
    -- Better quickfix window
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup()
    end,
  },
  {
    -- Dim parts of your code you're not workingon
    "folke/twilight.nvim",
    lazy = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("twilight").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "telescope.nvim",
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    enabled = true,
    config = function()
      require("config.noice")
      require("telescope").load_extension("noice")
    end,
  },
  {
    ---Status bars
    "akinsho/bufferline.nvim",
    config = function()
      require('bufferline').setup({})
    end,
    enabled = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config.lualine")
    end,
  },
  {
    -- Pretty notification windows/popups
    "rcarriga/nvim-notify",
    enabled = true,
    config = function()
      require("config.notify")
    end,
  },
  {
    -- Splash Screen/Dashboard
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.dashboard")
    end,
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = "MunifTanjim/nui.nvim",
  },
  {
    -- Smooth Scrolling
    "karb94/neoscroll.nvim",
    enabled = true,
    config = function()
      require("neoscroll").setup({
        easing_function = "quadratic",
      })
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
}
}
