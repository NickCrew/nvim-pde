--
-- LSP Configuration
--

local vim = vim

require("config.lsp.diagnostics")
require("nvim-lsp-installer").setup({})

local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

-- Capabilities
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Server Setup
lspconfig.bashls.setup({})
lspconfig.cssls.setup({})
lspconfig.dockerls.setup({})
lspconfig.eslint.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.remark_ls.setup({})
lspconfig.taplo.setup({})
lspconfig.terraformls.setup({})
lspconfig.tsserver.setup({})
lspconfig.vimls.setup({})
lspconfig.yamlls.setup({})

-- Python
lspconfig.pyright.setup({
	python = {
		analysis = {
			typeCheckingMode = "off",
		},
	},
})

-- Ansible
local ansible_python_bin_dir = vim.g.python_bin_dir
lspconfig.ansiblels.setup({
	settings = {
		ansible = {
			path = ansible_python_bin_dir .. "ansible",
		},
		ansibleLint = {
			enabled = true,
			path = ansible_python_bin_dir .. "ansible-lint",
		},
		python = {
			interpreterPath = ansible_python_bin_dir .. "python",
		},
	},
})

-- Rust
require("config.rust_tools")


