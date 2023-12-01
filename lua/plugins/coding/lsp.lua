return {
{
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    opts = {
    }
  },
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
}
