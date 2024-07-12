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
          {
            "SmiteshP/nvim-navbuddy",
            lazy = true,
            dependencies = {
              "SmiteshP/nvim-navic",
              "MunifTanjim/nui.nvim"
            },
            keys = {
              { "<C-n>", "<cmd>Navbuddy<CR>", mode = "n", desc = "Toggle NavBuddy" }
            },
            opts = {
              lsp = { auto_attach = true },
              border = "rounded",
              position = "90%",
              size = "30%"

            }
          }
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
            [ vim.diagnostic.severity.ERROR ] = "",
            [ vim.diagnostic.severity.WARN ] = "",
            [ vim.diagnostic.severity.INFO ] = "",
            [ vim.diagnostic.severity.HINT ] = ""
          }
        }
      })
      local deps = {
        "ansiblels",
        "dockerls",
        "cssls",
        "html",
        "helm-ls",
        "htmx",
        "jsonls",
        "lua_ls",
        "pyright",
        "remark_ls",
        "terraformls",
        "tsserver",
        "tflint",
        "yamlls",
      }

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())


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
      }

      require('mason-lspconfig').setup({ deps })
      require("mason-lspconfig").setup_handlers(handlers)
    end
  },
  {
    -- Completion and Snippets
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      {
        "f3fora/cmp-spell",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-buffer",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-cmdline",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-nvim-lua",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-emoji",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "hrsh7th/cmp-path",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "onsails/lspkind-nvim",
        lazy = true,
        event = "InsertEnter"
      },

      {
        "ray-x/cmp-treesitter",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "rcarriga/cmp-dap",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "saadparwaiz1/cmp_luasnip",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "petertriho/cmp-git",
        lazy = true,
        event = "InsertEnter"
      },
      {
        "lukas-reineke/cmp-rg",
        lazy = true,
        event = "InsertEnter"
      },

    },
    config = function()
      local icons = require("settings.icons")
      local cmp = require('cmp')
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
      end

      cmp.setup({
        enabled = function()
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
              or require("cmp_dap").is_dap_buffer()
        end,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 100,
            preset = "default",
            symbol_map = icons.kind,
            before = function(entry, vim_item)
              -- vim_item.kind = lspkind.presets.default[vim_item.kind]
              vim_item.menu = icons.alt.source[entry.source.name]
              return vim_item
            end,
          }),
        },
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.expand_or_jumpable(-1) then
              luasnip.expand_or_jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-q>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "copilot",    group_index = 2, max_item_count = 5 },
          { name = "nvim_lsp",   group_index = 2, max_item_count = 20 },
          { name = "nvim_lua",   group_index = 2 },
          { name = "luasnip",    group_index = 2, max_item_count = 20 },
          { name = "path",       group_index = 2, max_item_count = 5 },
          { name = "treesitter", group_index = 3, max_item_count = 10 },
          { name = "emoji",      group_index = 3, max_item_count = 10 },
          { name = "buffer",     group_index = 3, max_item_count = 10 },
          { name = "rg",         group_index = 3, max_item_count = 10 },
        }, {}),
        experimental = {
          ghost_text = true,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol" },
        }, {
          { name = "buffer" },
        }),
      })
      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })

      -- DAP
      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" }
        },
      })

      -- Git
      cmp.setup.filetype({ "gitcommit" }, {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        })
      })
    end,
  },
  {
    -- Lua-based snippet engine
    "L3MON4D3/LuaSnip",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    }
  },
  {
    -- Docstring generator
    "danymat/neogen",
    cmd = "Neogen",
    lazy = true,
    opts = {
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    },
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    enabled = true,
    lazy = true,
    event = "CmdlineEnter"
  },
  {
    -- AI code completion
    "zbirenbaum/copilot.lua",
    enabled = true,
    lazy = true,
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
        hcl = true,
        terraform = true
      }
    },
  },
  { 'AndreM222/copilot-lualine' },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = true
  },
{
    "kosayoda/nvim-lightbulb",
    enabled = false,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      float = {
        enabled = true,
        text = "💡",
        win_opts = {
          winblend = 100,
          border = "none",
        },
      },
      status_text = {
        enabled = true
      },
      autocmd = {
        enabled = true
      },
      ignore = {
        ft = {
          "neo-tree", "lua", "quickfix", "loclist", "telescope", "help"
        }
      }
    },
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    enabled = false,
    lazy = true
  },
}
