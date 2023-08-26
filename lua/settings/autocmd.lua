local vim = vim
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


--
-- Hover Diagnostic
-- 
augroup("hover", {})

autocmd("CursorHold", {
	group = "hover",
	pattern = "*",
	command = "lua require('nvim-lightbulb').update_lightbulb()",
})

autocmd("CursorHoldI", {
	group = "hover",
	pattern = "*",
	command = "lua require('nvim-lightbulb').update_lightbulb()",
})

autocmd("CursorHold", {
	group = "hover",
	pattern = "*",
	command = 'lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})',
})

--
-- Floating terminals (floatterm)
--
augroup("floatterm", {})

autocmd("termopen", {
	group = "floatterm",
	pattern = "term://*",
	command = "lua set_terminal_keymaps()",
})

