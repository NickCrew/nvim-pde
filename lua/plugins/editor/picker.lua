return {
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
    lazy = true,
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension('dap')
    end
  },
  {
    lazy = true,
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension('fzf')
    end
  },
  {
    lazy = true,
    "LinArcX/telescope-env.nvim",
    config = function()
      require("telescope").load_extension("env")
    end
  },
  {
    lazy = true,
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },
    {
    lazy = true,
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end
  }
}
