--[[
  - persistence
  - mason
  - distant
  - vs-tasks
  - nvim-dev-container
  - obsidian
--]]
return {
  {
    -- Smart Session Management
    "folke/persistence.nvim",
    lazy = true,
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require("mason").setup()
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

      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      --
      -- Capabilities
      --
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      --
      -- Server Setup
      --
      lspconfig.bashls.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.remark_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.taplo.setup({})
      lspconfig.terraformls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.vimls.setup({})

      --
      -- lua
      --
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      --
      -- Python
      --
      lspconfig.pyright.setup({
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


      --
      -- Ansible
      --
      lspconfig.ansiblels.setup({
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
  },
  {
    -- VS Code remote container support
    "chipsenkbeil/distant.nvim",
    lazy = true,
    enabled = false,
  },
  {
    -- Support for VS Code's task.json
    "EthanJWright/vs-tasks.nvim",
    lazy = true,
    enabled = true,
  },

  {
    -- VS Code container development support
    "esensar/nvim-dev-container",
    lazy = true,
    enabled = false,
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre /Users/nick/Obsidian/**.md",
      "BufNewFile /Users/nick/Obsidian/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      dir = "~/Obsidian",

    },
  }

}
