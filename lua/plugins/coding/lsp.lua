return {
  {
    "zeioth/garbage-day.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
      notifications = true,
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true
      },
      {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
          {
            "folke/lsp-colors.nvim",
            lazy = true,
          },
        },
        event = { "BufReadPre", "BufNewFile" },
      },
    },
    config = function()
      vim.diagnostic.config({
        underline = true,
        virtual_text = false,
        update_in_insert = true,
        float = {
          header = true,
          border = 'rounded',
          focusable = true
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = ""
          }
        }
      })

      local deps = {
        "ansiblels",
        "bashls",
        "dockerls",
        "cssls",
        "html",
        "helm-ls",
        "htmx",
        "jsonls",
        "lua_ls",
        "basedpyright",
        "remark_ls",
        -- "terraformls",
        "tsserver",
        "tflint",
        "vale_ls",
        "yamlls",
      }

      -- Add additional capabilities supported by nvim-cmp
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local handlers = {
        -- default
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities
          }
        end,

        -- Python
        ["basedpyright"] = function()
          lspconfig.basedpyright.setup({
            flags = {
              debounce_text_changes = 300
            },
            single_file_support = true,
            settings = {
              basedpyright = {
                disableLanguageServices = false,
                disableOrganizeImports = false
              },
              python = {
                analysis = {
                  autoImportCompletions = true,
                  autoSearchPaths = true,
                  diagnosticMode = "openFilesOnly",
                  useLibraryCodeForTypes = false,
                  typeCheckingMode = "basic",
                },
              },
            },
          })
        end,
        --- lua
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
               }
              }
            }
          })
        end,
      }

      require('mason-lspconfig').setup({ deps })
      require("mason-lspconfig").setup_handlers(handlers)
    end
  },
  
}
