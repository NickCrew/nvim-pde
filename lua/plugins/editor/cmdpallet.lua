return {
  {
    -- Telescope
    "nvim-telescope/telescope.nvim",
    version = false,
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>fa", "<cmd>Telescope aerial<cr>",        desc = "Find Symbols" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",       desc = "Find Buffer" },
      { "<leader>fc", "<cmd>Telescope registers<cr>",     desc = "Find in Registers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",    desc = "Find File" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",     desc = "Find String in Files" },
      { "<leader>fh", "<cmd>Telescope harpoon marks<cr>", desc = "Find Harpooned Files" },
      { "<leader>fm", "<cmd>Telescope marks<cr>",         desc = "Find in Marks" },
      { "<leader>fn", "<cmd>Telescope notify<cr>",        desc = "Find Notification" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",      desc = "Find Recent Files" },
      { "<leader>fs", "<cmd>Telescope luasnip<cr>",       desc = "Find Snippet" },
      { "<leader>ft", "<cmd>Telescope frecency<cr>",      desc = "Find Frecent Files" },
      { "<leader>fB", "<cmd>Telescope file_browser",      desc = "Find in File Browser" },

    },
    opts = function()
      local actions = require("telescope.actions")
      local themes = require("telescope.themes")
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
          layout_strategy = "horizontal",
          layout_config = {
            vertical = {
              prompt_position = "top",
              mirror = false,
              width = 0.6
            },
            horizontal = {
              width = 0.7,
              height = 0.7
            },
          },
          prompt_prefix = "  ",
          selection_caret = "   ",
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
          command_history = {
            theme = "dropdown"
          },
          harpoon = {
            theme = "dropdown"
          },
          find_files = {
            theme = "dropdown"
          },
          buffers = {
            theme = "dropdown"
          },
          marks = {
            theme = "cursor"
          }

        },
        extensions = {
          aerial = {
            show_nesting = true
          },
          file_browser = {
            theme = "dropdown"
          },
          fzf = {
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            themes.get_dropdown({}),
          },
          frecency = {
            db_root = vim.fn.stdpath("data"),
            ignore_patterns = { "*.git/*", "*/tmp/*" },
            workspaces = {
              ["work"] = os.getenv("HOME") .. "/Work",
              ["personal"] = os.getenv('HOME') .. "/Code",
              ["conf"] = os.getenv('HOME') .. "/.config",
              ["data"] = os.getenv('HOME') .. "/.local/share"
            }
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

            git_diffs = {
              git_command = { "git", "log", "--oneline", "--decorate", "--all", "." } -- list result
            },
            project = {
              base_dirs = {
                { path = "~/Work", max_depth = 2 },
                { path = "~/Code", max_depth = 2 }
              },
              hidden_files = false,
              theme = "dropdown",
              order_by = "asc",
              search_by = "title",
              -- on_project_selected = function(prompt_bufnr)
              --   project_actions.change_working_directory(prompt_bufnr, false)
              --   require("harpoon.ui").nav_file(1)
              -- end

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
    "gbprod/yanky.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("yank_history")
    end
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  {
    "nvim-telescope/telescope-github.nvim",
    config = function()
      require('telescope').load_extension('gh')
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
    "nvim-telescope/telescope-project.nvim",
    lazy = true,
    config = function()
      require 'telescope'.load_extension('project')
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").load_extension("ui-select")
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
    'barrett-ruth/telescope-http.nvim',
    dependencies = {
      'savq/paq-nvim'
    },
    lazy = true,
    config = function()
      require("telescope").load_extension("http")
    end
  },
  {
    'olacin/telescope-cc.nvim',
    lazy = true,
    config = function()
      require('telescope').load_extension('cc')
    end
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    config = function()
      require 'telescope'.extensions.projects.projects {}
    end
  },
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    config = function()
      require("telescope").load_extension("harpoon")
    end
  },
  {
    "paopaol/telescope-git-diffs.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("git_diffs")
    end

  },
  {
    "mrjones2014/legendary.nvim",
    version  = "v2.1.0",
    enabled  = false,
    lazy     = false,
    priority = 10000,
    opts     = {
      lazy_nvim = {
        auto_register = true
      },
      which_key = {
        auto_register = true
      }
    }
  },

}
