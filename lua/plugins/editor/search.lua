-- plugins.editor.search
--[[
 - oil
 - spectre
 - telescope
 - legendary
 - which-key
--]]
return {
  {
    "mrjones2014/legendary.nvim",
    version  = "v2.1.0",
    enabled  = true,
    lazy     = false,
    priority = 10000,
    keys     = {
      { "<C-p>", "<cmd>Legendary<cr>", desc = "Legendary" },
    },
    opts     = {
      lazy_nvim = {
        auto_register = true
      },
      which_key = {
        auto_register = true
      }
    }
  },
  {
    "stevearc/oil.nvim",
    config = true,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    version = false,
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = function()
      local actions = require("telescope.actions")

      local open_with_trouble = function(...)
        return require("trouble.providers.telescope").open_with_trouble(...)
      end

      local open_selected_with_trouble = function(...)
        return require("trouble.providers.telescope").open_selected_with_trouble(...)
      end

      local get_selected_window = function()
        local wins = vim.api.nvim_list_wins()
        table.insert(wins, 1, vim.api.nvim_get_current_win())
        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].buftype == "" then
            return win
          end
        end
        return 0
      end

      return {
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
          get_selection_window = get_selected_window,
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-t>"] = open_with_trouble,
              ["<A-t"] = open_selected_with_trouble,
              ["<esc>"] = actions.close,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["<C-t>"] = open_with_trouble,
              ["<A-t"] = open_selected_with_trouble,
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown"
          },
          buffers = {
            theme = "dropdown"
          }

        },
        extensions = {
          aerial = {
            show_nesting = true
          },
          file_browser = {},
          fzf = {
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          lazy = {
            -- Optional theme (the extension doesn't set a default theme)
            theme = "ivy",
            -- Whether or not to show the icon in the first column
            show_icon = true,
            -- Mappings for the actions
            mappings = {
              open_in_browser = "<C-o>",
              open_in_file_browser = "<M-b>",
              open_in_find_files = "<C-f>",
              open_in_live_grep = "<C-g>",
              open_in_terminal = "<C-t>",
              open_plugins_picker = "<C-b>", -- Works only after having called first another action
              open_lazy_root_find_files = "<C-r>f",
              open_lazy_root_live_grep = "<C-r>g",
            },
            -- Configuration that will be passed to the window that hosts the terminal
            -- For more configuration options check 'nvim_open_win()'
            terminal_opts = {
              relative = "editor",
              style = "minimal",
              border = "rounded",
              title = "Telescope lazy",
              title_pos = "center",
              width = 0.5,
              height = 0.5,
            },
            -- Other telescope configuration options
          },
        },
      }
    end
  },
  {
    "HUAHUAI23/telescope-dapzzzz",
    lazy = true,
    config = function()
      require("telescope").load_extension("i23")
    end
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension('dap')
    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make",
    config = function()
      require("telescope").load_extension('fzf')
    end
  },
  {
    "LinArcX/telescope-env.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("env")
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-github.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension('gh')
    end
  },
  {
    "xiyaowong/telescope-emoji.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("emoji")
    end
  },
  {
    "ghassan0/telescope-glyph.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("glyph")
    end
  },
  {
    "tsakirist/telescope-lazy.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("lazy")
    end
  },
  {
    lazy = true,
    "benfowler/telescope-luasnip.nvim",
    config = function()
      require("telescope").load_extension("luasnip")
    end
  },

  {
    "folke/which-key.nvim",
    enabled = true,
    opts = {
      plugins = {
        marks = true,      -- shows a list of your marks on ' and `
        registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 9, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          g = true,            -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      window = {
        border = "shadow",         -- none, single, double, shadow
        position = "bottom",       -- bottom, top
        margin = { 1.8, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 },  -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 1, max = 35 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 1,                    -- spacing between columns
        align = "center",               -- align columns left, center or right
      },
      ignore_missing = false,           -- enable this to hide mappings for which you didn't specify a label
      hidden = {
        "<silent>",
        "<cmd>",
        "<Cmd>",
        "<CR>",
        "call",
        "lua",
        "^:",
        "^ ",
      },                 -- hide mapping boilerplate
      show_help = true,  -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      -- triggers = { "<leader>" }, -- or specify a list manually

      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        n = { "o", "O" },
      },
    }
  },

}
