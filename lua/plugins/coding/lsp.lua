return {

  {
    "williamboman/mason.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    lazy = false,
    enabled = true,
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          "ansiblels",
          "bashls",
          "dockerls",
          "gopls",
          "helm_ls",
          "jsonls",
          "lua_ls",
          "pyright",
          "remark_ls",
          "rust_analyzer",
          "taplo",
          "terraformls",
          "tsserver",
          "vimls",
          "yamlls",
        },
        automatic_installations = true
      })

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local handlers = {
        -- default
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,
        -- Python
        ["pyright"] = function()
          require("lspconfig").pyright.setup({
            flags = {
              debounce_text_changes = 300
            },
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = true,
                  typeCheckingMode = "basic",
                },
              },
            },
          })
        end,
        --- lua
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          })
        end,
        -- Ansible
        ["ansiblels"] = function()
          require("lspconfig").ansiblels.setup({
            settings = {
              ansible = {
                path = "/usr/local/Homebrew/ansible",
              },
              ansibleLint = {
                enabled = true,
                path = "/usr/local/Homebrew/ansible-lint"
              },
              python = {
                interpreterPath = "/usr/local/Homebrew/python3"
              },
            },
          })
        end
      }

      require("mason-lspconfig").setup_handlers(handlers)

      -- Use LspAttach autocommand to only map the following keys

      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      "folke/lsp-colors.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "kosayoda/nvim-lightbulb",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      status_text = {
        enabled = true
      },
      autocmd = {
        enabled = true
      },
      ignore = {
        ft = {
          "neo-tree", "lua", "quickfix", "loclist", "telescope"
        }
      }
    },
  },
  {
    "mhartington/formatter.nvim",
    lazy = true,
  },
  {
    "mfussenegger/nvim-lint",
    lazy = true
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    lazy = true
  },
  {
    -- Schemas
    "b0o/schemastore.nvim",
    lazy = true,
    enabled = true,
    ft = { "yaml", "json" },
  },
  {
    -- Enhance LSP Diagnostics
    "folke/trouble.nvim",
    -- lazy = true,
    lazy = false,
    keys = {
      { "<leader>xD", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Toggle Document Diagnostics", },
      { "<leader>xW", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Workspace Diagnostics", },
      { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",        desc = "Toggle LSP References", },
      { "<leader>xd", "<cmd>TroubleToggle lsp_definitions<cr>",       desc = "Toggle LSP Definitions", },
      { "<leader>xi", "<cmd>TroubleToggle lsp_implementations<cr>",   desc = "Toggle LSP Implementations", },
      { "<leader>xt", "<cmd>TroubleToggle lsp_type_definitions<cr>",  desc = "Toggle LSP Type Defintiosn", },
      { "<leader>xx", "<cmd>TroubleToggle<cr>",                       desc = "Toggle All Diagnostics", },
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
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      signs = require("settings._icons").diagnostics_solid,
      use_diagnostic_signs = false       -- enabling this will use the signs defined in your lsp client
    },
  },
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
      focus_on_open = true,   -- Focus the floating window when opening it.
      dismiss_on_move = true, -- Dismiss the floating window when moving the cursor.
      force_close = true,     -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = "wipe",     -- the bufhidden option to set on the floating window. See :h bufhidden
    }
  },

}
