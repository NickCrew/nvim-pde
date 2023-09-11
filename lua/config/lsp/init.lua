
-- LSP Configuration
--
--
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
	},
})


local icons = require("settings.ui.icons")

for type, icon in pairs({
  DiagnosticSignError       = icons.diagnostics_fancy.error,
  DiagnosticSignWarning     = icons.diagnostics_fancy.warning,
  DiagnosticSignWarn        = icons.diagnostics_fancy.warning,
  DiagnosticSignHint        = icons.diagnostics_fancy.hint,
  DiagnosticSignInformation = icons.diagnostics_fancy.information,
  DiagnosticSignInfo        = icons.diagnostics_fancy.information ,
}) do
  vim.fn.sign_define(type, { 
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end



require("nvim-lsp-installer").setup({})

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
lspconfig.cssls.setup({})
lspconfig.dockerls.setup({})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
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


--
-- Rust
--
local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
require("rust-tools").setup({
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(
			codelldb_path,
			liblldb_path
		),
	},
})
