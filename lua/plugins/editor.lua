--[[
Group: Editor Enhancements

Plugins:
 - vim-commentary
 - refactoring
 - hop
 - flash
 - telescope
 - harpoon
 - toggleterm
 - legendary
 - which-key

--]]
return {
  {
    -- Syntax-aware commenting
    "tpope/vim-commentary",
    enabled = true,
  },
  {
    -- Code refactoring
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    config = function()
      require("refactoring").setup()
      require("telescope").load_extension("refactoring")
    end,
  },
  {
    -- Quick movements
    "phaazon/hop.nvim",
    branch = 'v2',
    opts = {
      case_insensitive = true
    }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function() require("flash").jump() end,
        desc = "Flash"
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search"
      },
    },
  },
  {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    priority = 200,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "tami5/sqlite.lua",
      "folke/trouble.nvim",
      {
        "nvim-telescope/telescope-dap.nvim",
        config = function()
          require("telescope").load_extension('dap')
        end
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension('fzf')
        end
      },
      {
        "LinArcX/telescope-env.nvim",
        config = function()
          require("telescope").load_extension("env")
        end
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end
      },
      {
        "benfowler/telescope-luasnip.nvim",
        config = function()
          require("telescope").load_extension("luasnip")
        end
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require("telescope").load_extension("ui-select")
        end
      }

    },
    opts = {
      defaults = {
        layout_strategy = "center",
        layout_config = {
          center = { width = 0.8 }
        },
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--ignore-file",
          (vim.fn.stdpath("config") .. "/.telescope_ignore"),
        },
        prompt_prefix = " ",
        selection_caret = " ",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = {},
        winblend = 0,
        border = {},
        borderchars = {
          "─",
          "│",
          "─",
          "│",
          "╭",
          "╮",
          "╯",
          "╰",
        },
        color_devicons = true,
        use_less = true,
        dynamic_preview_title = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
            -- ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<esc>"] = require("telescope.actions").close,
            ["<C-h>"] = function(prompt_bufnr)
              local opts = {
                callback = require("telescope.actions").toggle_selection,
                loop_callback = require("telescope.actions").send_selected_to_qflist,
              }
              require("telescope").extensions.hop._hop_loop(
                prompt_bufnr,
                opts
              )
            end,
          },
          n = {
            -- ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<esc>"] = require("telescope.actions").close,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--hidden",
            "--no-heading",
            "--with-filename",
            "--files",
            "--column",
            "--smart-case",
            "--ignore-file",
            (vim.fn.stdpath("config") .. "/.telescope_ignore"),
            "--iglob",
            "!.git",
          },
        },
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
      },
    },
  },
  {
    -- Hyperfast project navigation
    "ThePrimeagen/harpoon",
    lazy = true,
    dependencies = "telescope.nvim",
    config = function()
      require("harpoon").setup({
        -- dynamic width menu
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
          enter_on_sendcmd = true,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
        },
      })
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    lazy = true,
    branch = "main",
    opts = {
      on_config_done = nil,
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 3,     -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = true,
      -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell,  -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_win_open'
        -- see :h nvim_win_open for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = "curved",
        width = 120,
        height = 30,
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
  },
  {
    "mrjones2014/legendary.nvim",
    lazy = true,
    enabled = true,
    opts = {
      which_key = {
        auto_register = true
      }
    }
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
