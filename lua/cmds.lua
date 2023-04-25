local vim = vim
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
local execute = vim.api.nvim_cmd

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

-- User Commands
usercmd("TestFunc", "lua require('dap-python').test_method()", {})
usercmd("TestClass", "lua require('dap-python').test_class()", {})
usercmd("BreakpointToggle", "lua require('dap').toggle_breakpoint()", {})
usercmd("DebugSelection", "lua require('dap-python').debug_selection()", {})
usercmd("Debug", "lua require('dap').continue()", {})
usercmd("DapREPL", "lua require('dap').repl.open()", {})
usercmd("DapCmds", ":lua require('telescope').extensions.dap.commands()", {})
usercmd("Format", "lua vim.lsp.buf.format()", {})
usercmd("ReloadLuaFile", ":luafile %", {})
usercmd(
	"CreateWorktree",
	":lua require('telescope').extensions.git_worktree.create_git_worktree()",
	{}
)
usercmd(
	"ListWorktrees",
	":lua require('telescope').extensions.git_worktree.git_worktrees()",
	{}
)
usercmd(
	"RefactorExtractBlock",
	" <Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
	{}
)
usercmd(
	"RefactorExtractBlockToFile",
	"<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
	{}
)
usercmd(
	"RefactorInlineVariable",
	"<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
	{}
)

for _, abbrev in ipairs({
	{ "Bpt", "BreakpointToggle" },
	{ "Cgwt", "CreateWorktree" },
	{ "Dap", "Debug" },
	{ "Dc", "DapCmds" },
	{ "Ds", "DebugSelection" },
	{ "Ff", "Fern" },
	{ "Fmt", "Format" },
	{ "Gs", "Gitsigns" },
	{ "Lgwt", "ListWorktrees" },
	{ "Mt", "MundoToggle" },
	{ "N", "Neogen" },
	{ "Pc", "PackerCompile" },
	{ "Pi", "PackerInstall" },
	{ "Ps", "PackerSync" },
	{ "Pu", "PackerUpdate" },
	{ "Rlf", "ReloadLuafile" },
	{ "T", "Telescope" },
	{ "Wk", "WhichKey" },
}) do
	execute({
		cmd = "cnoreabbrev",
		args = abbrev,
	}, {})
end
