local null_ls = require("null-ls")
local formatting, code_actions, hover, diagnostics =
	null_ls.builtins.formatting,
	null_ls.builtins.code_actions,
	null_ls.builtins.hover,
	null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		-- Hover
		hover.printenv,
		-- Code Actions
		code_actions.refactoring,
		-- Diagnostics
		diagnostics.jsonlint,
		-- Formatting
		formatting.stylua,
		formatting.yapf,
		formatting.isort,
		formatting.markdown_toc,
	},
})
