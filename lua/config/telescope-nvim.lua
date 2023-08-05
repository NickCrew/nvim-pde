-- Configure Telescope
local actions = require('telescope.actions')

local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup({
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
        -- prompt_prefix = "  ",
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
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        dynamic_preview_title = true,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<C-t>"] = trouble.open_with_trouble,
                ["<esc>"] = actions.close,
                ["<C-h>"] = function(prompt_bufnr)
                    local opts = {
                        callback = actions.toggle_selection,
                        loop_callback = actions.send_selected_to_qflist,
                    }
                    require("telescope").extensions.hop._hop_loop(
                        prompt_bufnr,
                        opts
                    )
                end,
            },
            n = {

                ["<C-t>"] = trouble.open_with_trouble,
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
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
        -- fzf = {
        --     fuzzy = true,
        --     override_generic_sorter = true,
        --     override_file_sorter = true,
        --     case_mode = "smart_case",
        -- },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
            -- even more opts
        },
    },
})

-- telescope.load_extension('fzf')

