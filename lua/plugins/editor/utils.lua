return {
{
    'willothy/wezterm.nvim',
    lazy = true,
    enabled = true,
    config = true
  },
  {
    'echasnovski/mini.splitjoin',
    version = false,
    enabled = true,
    lazy = false,
    keys = {
      {'<leader>ms',  mode = 'n', '<cmd>lua MiniSplitjoin.split()<cr>', desc = 'MiniSplitjoin' },
      {'<leader>mj',  mode = 'n', '<cmd>lua MiniSplitjoin.join()<cr>', desc = 'MiniSplitjoin'}
    },
    config = function()
      require('mini.splitjoin').setup{}
    end
  },
{
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = "ToggleTerm",
    version = "*",
    config = true
  },
{
    -- VS Code remote container support
    "chipsenkbeil/distant.nvim",
    lazy = true,
    Enabled = false,
  },
  {
    -- VS Code container development support
    "esensar/nvim-dev-container",
    lazy = true,
    enabled = false,
  },
  {
    -- Smart Session Management
    "folke/persistence.nvim",
    lazy = true,
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
  {
    "folke/neoconf.nvim",
    lazy = true,
    config = true,
    enabled = false
  },
  {
    -- Support for VS Code's task.json
    "EthanJWright/vs-tasks.nvim",
    lazy = true,
    enabled = false,
  },
  -- neorg
  {
    "nvim-neorg/neorg",
    enabled = false,
    lazy =true,
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
          config = { engine = "nvim-cmp" },
        },
        ["core.integrations.nvim-cmp"] = {},
      },
    },
  },

  -- markdown preview
  {
    "toppair/peek.nvim",
    lazy = true,
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "light" },
  },

  -- better diffing
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },

  -- colorizer
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
  },
}
