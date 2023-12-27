return {
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = "ToggleTerm",
    version = "*",
    config = true
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" }
    },
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    lazy = true,
    config = true
  },

  {
    "s1n7ax/nvim-window-picker",
    name = 'window-picker',
    event = "VeryLazy",
    version = '2.*',
    config = true
  },
  {
    "folke/edgy.nvim",
    lazy = true,
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = {
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        {
          title = "Terminal",
          ft = "toggleterm",
          size = { height = 0.4 },
          -- exclude floating windows
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.4 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        {
          ft = "qf",
          title = "QuickFix"
        },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        {
          title = "Search & Replace",
          ft = "spectre_panel",
          size = { height = 0.4 }
        },
      },
      right = {
        title = "Aerial",
        ft = "aerial"
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Explorer",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.3 },
        },
        {
          title = "Git Status",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "Buffers",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        {
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutlineOpen",
          size = { width = 40, height = 0.3 },
        },
        -- any other neo-tree windows
        "neo-tree",
      },
    },
  },
{
    -- LSP Symbol Drawer
    "stevearc/aerial.nvim",
    lazy = true,
    opts = {
      backends = {
        "lsp",
        "treesitter",
        "markdown",
        "man",
      },
      attach_mode = "window",
      close_automatic_events = {
        "unsupported",
        "switch_buffer",
        "unfocus",
      },
      default_bindings = true,
      layout = {
        default_direction = "prefer_right",
        min_width = 30,
        max_width = 50,
      },
      post_jump_cmd = "normal! zz",
      lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
      },
    }
  },
}
