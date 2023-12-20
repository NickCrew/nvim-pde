
return {
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
  {
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    lazy = true,
    cmd = "TroubleToggle",
    opts = {
      width = 50, -- width of the list when position is left or right
      position = "bottom", -- position of the list can be: bottom, top, left, right
      icons = true, -- use devicons for filenames
      mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      action_keys = {
        -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q",                                       -- close the list
        cancel = "<esc>",                                  -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",                                     -- manually refresh
        jump = { "<cr>", "<tab>" },                        -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },                          -- open buffer in new split
        open_vsplit = { "<c-v>" },                         -- open buffer in new vsplit
        open_tab = { "<c-t>" },                            -- open buffer in new tab
        jump_close = { "o" },                              -- jump to the diagnostic and close the list
        toggle_mode = "m",                                 -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P",                              -- toggle auto_preview
        hover = "K",                                       -- opens a small popup with the full multiline message
        preview = "p",                                     -- preview the diagnostic location
        close_folds = { "zM", "zm" },                      -- close all folds
        open_folds = { "zR", "zr" },                       -- open all folds
        toggle_fold = { "zA", "za" },                      -- toggle fold of current file
        previous = "k",                                    -- preview item
        next = "j"                                         -- next item
      },
      indent_lines = true,                                 -- add an indent guide below the fold icons
      auto_open = false,                                   -- automatically open the list when you have diagnostics
      auto_close = true,                                   -- automatically close the list when you have no diagnostics
      auto_preview = true,                                 -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false,                                   -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions", "lsp_references" }, -- for the given modes, automatically jump if there is only a single result
      use_diagnostic_signs = false,                        -- enabling this will use the signs defined in your lsp client
      signs = {
        error       = " ",
        warning     = " ",
        information = " ",
        other       = " ",
        hint        = " ",
      },
    }
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
  },
  {
    'akinsho/toggleterm.nvim',
    cmd = "ToggleTerm",
    version = "*",
    config = true
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    cmd = "Neotree",
    keys = {
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
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
    "stevearc/dressing.nvim",
    opts = {}
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
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Explorer",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
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
        },
        -- any other neo-tree windows
        "neo-tree",
      },
    },
  },

  -- amongst your other plugins
}
