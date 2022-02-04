return {
  "nvim-telescope/telescope.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "folke/trouble.nvim",
    "tami5/sqlite.lua",
    "nvim-telescope/telescope-symbols.nvim",
    "jvgrootveld/telescope-zoxide",
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-vimspector.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-vimspector.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "mrjones2014/dash.nvim", run = "make install" },
  },
  config = function()
    local trouble = require("trouble.providers.telescope")
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
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
        prompt_prefix = "   ",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        dynamic_preview_title = true,
        mappings = {
          i = {
            ["<c-t>"] = trouble.open_with_trouble,
            ["<esc>"] = actions.close,
             ["<C-h>"] = R("telescope").extensions.hop.hop,  -- hop.hop_toggle_selection
        -- custom hop loop to multi selects and sending selected entries to quickfix list 
        ["<C-space>"] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist,
          }
          require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
        end,
          },
          n = {
            ["<c-t>"] = trouble.open_with_trouble,
            ["<esc>"] = actions.close,
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
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
          -- even more opts
        },
        hop = {
          -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
          keys = {
            "a",
            "s",
            "d",
            "f",
            "g",
            "h",
            "j",
            "k",
            "l",
            ";",
            "q",
            "w",
            "e",
            "r",
            "t",
            "y",
            "u",
            "i",
            "o",
            "p",
            "A",
            "S",
            "D",
            "F",
            "G",
            "H",
            "J",
            "K",
            "L",
            ":",
            "Q",
            "W",
            "E",
            "R",
            "T",
            "Y",
            "U",
            "I",
            "O",
            "P",
          },
          -- Highlight groups to link to signs and lines; the below configuration refers to demo
          -- sign_hl typically only defines foreground to possibly be combined with line_hl
          sign_hl = { "WarningMsg", "Title" },
          -- optional, typically a table of two highlight groups that are alternated between
          line_hl = { "CursorLine", "Normal" },
          -- options specific to `hop_loop`
          -- true temporarily disables Telescope selection highlighting
          clear_selection_hl = false,
          -- highlight hopped to entry with telescope selection highlight
          -- note: mutually exclusive with `clear_selection_hl`
          trace_entry = true,
          -- jump to entry where hoop loop was started from
          reset_selection = true,
        },
        dash = {
          -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
          --dash_app_path = '/Applications/Dash.app/Contents/Resources/dashAlfredWorkflow',
          -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
          search_engine = "ddg",
          -- debounce while typing, in milliseconds
          debounce = 0,
          -- map filetype strings to the keywords you've configured for docsets in Dash
          -- setting to false will disable filtering by filetype for that filetype
          -- filetypes not included in this table will not filter the query by filetype
          -- check src/lua_bindings/dash_config_binding.rs to see all defaults
          -- the values you pass for file_type_keywords are merged with the defaults
          -- to disable filtering for all filetypes,
          -- set file_type_keywords = false

          file_type_keywords = {
            dashboard = false,
            NvimTree = false,
            TelescopePrompt = false,
            terminal = false,
            packer = false,
            fzf = false,
            -- a table of strings will search on multiple keywords
            yaml = { "yml" },
            javascript = { "javascript", "nodejs" },
            typescript = { "typescript", "javascript", "nodejs" },
          },
        },
      },
    })

    require'telescope'.load_extension("zoxide")
    require'telescope'.load_extension("projects")
    require'telescope'.load_extension("vimspector")
    require'telescope'.load_extension("fzf")
    require'telescope'.load_extension("ui-select")
    require'telescope'.load_extension("cheatsheet")
    require'telescope'.load_extension("frecency")
    require'telescope'.load_extension("gh")
    require'telescope'.load_extension("dash")

    require("keymap").apply_telescope_keymaps()
  end,
}
