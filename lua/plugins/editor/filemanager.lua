return {
  {
    -- You can also use the codeberg mirror if you want to use the plugin without relying on GitHub
    -- "https://codeberg.org/CodingThunder/zincoxide.git" -- for HTTPS
    -- "git@codeberg.org:CodingThunder/zincoxide.git"     -- for SSH
    "thunder-coding/zincoxide",
    opts = {
      -- name of zoxide binary in your "$PATH" or path to the binary
      -- the command is executed using vim.fn.system()
      -- eg. "zoxide" or "/usr/bin/zoxide"
      zincoxide_cmd = "zoxide",
      -- Kinda experimental as of now
      complete = true,
      -- Available options { "tabs", "window", "global" }
      behaviour = "tabs",
    },
    cmd = { "Z", "Zg", "Zt", "Zw" },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    enabled = true,
    lazy = true,
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>et",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Toggle NeoTree",
      },
      {
        "<leader>er",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>ec",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer explorer",
      },
    },
  },
  {
    'echasnovski/mini.files',
    version = false,
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<leader>mm", "<cmd>lua MiniFiles.open()<cr>", desc = "Toggle file manager" }
    },
    opts = {
      options = {
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
        width_preview = 75,
      },
    },
  },

}
