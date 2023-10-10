local mk_augroup = vim.api.nvim_create_augroup
local mk_aucmd = vim.api.nvim_create_autocmd

mk_augroup("CursorHold", {})
mk_aucmd("CursorHold", {group = "CursorHold", pattern = "*", command = "lua require('nvim-lightbulb').update_lightbulb()", })
mk_aucmd("CursorHoldI", {group = "CursorHold", pattern = "*", command = "lua require('nvim-lightbulb').update_lightbulb()", })
mk_aucmd("CursorHold", { group = "CursorHold", pattern = "*", command = 'lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})', })

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


