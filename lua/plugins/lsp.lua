return {
  {
    -- Lua development tools
    "folke/lua-dev.nvim",
    ft = { "lua" },
    lazy = true
  },
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml" },
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
  {
    "mfussenegger/nvim-ansible",
    ft = { "yaml", "yaml.ansible" },
    lazy = true
  },
  {
    -- Live markdown preview
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    -- Schemas
    "b0o/schemastore.nvim",
    enabled = true,
  },
  {
    "folke/neoconf.nvim",
    lazy = true,
    opts = {}
  },
  {
    "folke/neodev.nvim",
    lazy = true,
    opts = {}
  },
  
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
      "weilbith/nvim-code-action-menu",
      "ray-x/lsp_signature.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "folke/lsp-colors.nvim",
      "nvim-lua/lsp-status.nvim",
      "kosayoda/nvim-lightbulb"
    },
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rs",
    opts = function()
      local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      return {
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(
            codelldb_path,
            liblldb_path
          ),
        },
      }
    end
  },
  {
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    lazy = true,
    opts = {
      position = "bottom", -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
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
      auto_close = false,                -- automatically close the list when you have no diagnostics
      auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false,                 -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      signs = require("settings.ui.icons").diagnostics,
      use_diagnostic_signs = false       -- enabling this will use the signs defined in your lsp client
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "javascript",
      -- "python",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      -- "json",
      "markdown",
      "lua",
    },
    config = function()
      require("config.null_ls")
    end,
    enabled = false,
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    lazy = true
  },
  {
    -- LSP Symbol Drawer
    "stevearc/aerial.nvim",
    dependencies = { "telescope.nvim" },
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
    -- Popup preview window for LSP
    "rmagatti/goto-preview",
    event = "BufEnter",
    lazy = true,
    opts = {
      width = 120, -- Width of the floating window
      height = 20, -- Height of the floating window
      border = {
        "↖",
        "─",
        "┐",
        "│",
        "┘",
        "─",
        "└",
        "│",
      },                         -- Border characters of the floating window
      default_mappings = false,  -- Bind default mappings
      debug = false,             -- Print debug information
      opacity = nil,             -- 0-100 opacity level of the floating window where 100 is fully transparent.
      resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
      post_open_hook = nil,      -- A function taking two arguments, a buffer and a window to be ran as a hook.
      references = {
        -- Configure the telescope UI for slowing the references cycling window.
        telescope = require("telescope.themes").get_dropdown({
          hide_preview = false,
        }),
      },
      focus_on_open = true,    -- Focus the floating window when opening it.
      dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
      force_close = true,      -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = "wipe",      -- the bufhidden option to set on the floating window. See :h bufhidden
    }
  },

}
