return {
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
      "HUAHUAI23/telescope-dapzzzz",
      config = function()
        require("telescope").load_extension("i23")
      end
      },
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
}
