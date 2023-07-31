local vim = vim
local usercmd = vim.api.nvim_create_user_command



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
usercmd("UpdateTheme", "lua require('utils').update_theme()", {})
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


