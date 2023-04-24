-- vim: set foldmethod=marker foldmarker={{{,}}} :
-------------------------------------------------------------------------------
-- Title: LSP Config
-- File: lua/config/lsp/init.lua
-- Description: This module installs and intializes language servers and plugins.
-------------------------------------------------------------------------------

local vim = vim
local fn = vim.fn

------[ DEFAULT CONFIGURATION ] {{{

require("config.lsp.highlights")

require("nvim-lsp-installer").setup({})

local lspconfig = require("lspconfig")

lspconfig.util.default_config = vim.tbl_deep_extend(
	"force",
	lspconfig.util.default_config,
	require("config.lsp.defaults")
)

-- }}}

-----[ PLUGIN CONFIGURATION ] {{{

require("lsp_signature").setup({
	bind = true,
	handler_opts = { border = "single" },
	fix_pos = true,
	hint_enable = true,
	hint_prefix = "",
	padding = "",
})

require("toggle_lsp_diagnostics").init({
	start_on = true,
	underline = true,
	signs = true,
	virtual_text = false,
})
-- }}}

-----[ LSP CLIENT CONFIGURATION ] {{{
lspconfig.lua_ls.setup({})
lspconfig.cssls.setup({})
lspconfig.remark_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.vimls.setup({})
lspconfig.terraformls.setup({})
lspconfig.jsonls.setup({})

--
-- PYTHON
lspconfig.pyright.setup({
	python = {
		analysis = {
			typeCheckingMode = "off",
		},
	},
})

--
-- ANSIBLE
local python_bin_dir = vim.env.HOME .. "/.pyenv/versions/neovim/bin"
lspconfig.ansiblels.setup({
	settings = {
		ansible = {
			path = python_bin_dir .. "ansible",
		},
		ansibleLint = {
			enabled = true,
			path = python_bin_dir .. "ansible-lint",
		},
		python = {
			interpreterPath = python_bin_dir .. "python",
		},
	},
})

--
-- RUST
local extension_path = vim.env.HOME
	.. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
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


-- }}}
