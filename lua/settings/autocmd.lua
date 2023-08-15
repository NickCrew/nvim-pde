local vim = vim
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- Groups
augroup("hover", {})
augroup("windows", {})
augroup("terms", {})


-- Commands

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

autocmd("termopen", {
	group = "terms",
	pattern = "term://*",
	command = "lua set_terminal_keymaps()",
})


autocmd("BufWritePost", {
callback = function()
  require("lint").try_lint()
end
})
