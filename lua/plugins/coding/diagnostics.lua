-- Error/Warnings Viewer
--
return {
  {
    -- LSP Symbol Drawer
    "stevearc/aerial.nvim",
    lazy = true,
    config = function()
      require("aerial").setup({
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
      })
      require("telescope").load_extension("aerial")
    end,
  },
  {
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    -- lazy = true,
    lazy = false,
    keys = {
      { "<C-g>d",     "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Toggle Document Diagnostics", },
      { "<C-g>w",     "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Workspace Diagnostics", },
      { "<C-g>r",     "<cmd>TroubleToggle lsp_references<cr>",        desc = "Toggle LSP References", },
      { "<C-g><C-d>", "<cmd>TroubleToggle lsp_definitions<cr>",       desc = "Toggle LSP Definitions", },
      { "<C-g><C-g>", "<cmd>TroubleToggle<cr>",                       desc = "Toggle All Diagnostics", },

      { "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Toggle Document Diagnostics", },
      { "<leader>wd", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Workspace Diagnostics", },
      { "<leader>gr", "<cmd>TroubleToggle lsp_references<cr>",        desc = "Toggle LSP References", },
      { "<leader>gd", "<cmd>TroubleToggle lsp_definitions<cr>",       desc = "Toggle LSP Definitions", },
      { "<leader>gi", "<cmd>TroubleToggle lsp_implementations<cr>",   desc = "Toggle LSP Implementations", },
      { "<leader>gt", "<cmd>TroubleToggle lsp_type_definitions<cr>",  desc = "Toggle LSP Type Defintiosn", },
      { "<leader>gg", "<cmd>TroubleToggle<cr>",                       desc = "Toggle All Diagnostics", },
    },
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
        close = "q",                     -- close the list
        cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",                   -- manually refresh
        jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },        -- open buffer in new split
        open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
        open_tab = { "<c-t>" },          -- open buffer in new tab
        jump_close = { "o" },            -- jump to the diagnostic and close the list
        toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P",            -- toggle auto_preview
        hover = "K",                     -- opens a small popup with the full multiline message
        preview = "p",                   -- preview the diagnostic location
        close_folds = { "zM", "zm" },    -- close all folds
        open_folds = { "zR", "zr" },     -- open all folds
        toggle_fold = { "zA", "za" },    -- toggle fold of current file
        previous = "k",                  -- preview item
        next = "j"                       -- next item
      },
      indent_lines = true,               -- add an indent guide below the fold icons
      auto_open = false,                 -- automatically open the list when you have diagnostics
      auto_close = true,                 -- automatically close the list when you have no diagnostics
      auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false,                 -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions", "lsp_references" }, -- for the given modes, automatically jump if there is only a single result
      signs = require("settings._icons").diagnostics_solid,
      use_diagnostic_signs = false       -- enabling this will use the signs defined in your lsp client
    },
  },
}
