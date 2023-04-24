-- User defined commands

local vim = vim
local user_cmd = vim.api.nvim_create_user_command

-- DAP/Debugging
user_cmd("TestFunc", "lua require('dap-python').test_method()", {})
user_cmd("TestClass", "lua require('dap-python').test_class()", {})
user_cmd("BreakpointToggle", "lua require('dap').toggle_breakpoint()", {})
user_cmd("DebugSelection", "lua require('dap-python').debug_selection()", {})
user_cmd("Debug", "lua require('dap').continue()", {})
user_cmd("DapREPL", "lua require('dap').repl.open()", {})
user_cmd("DapCmds", ":lua require('telescope').extensions.dap.commands()", {})
-- Buffer
user_cmd("Format", "lua vim.lsp.buf.format()", {})
user_cmd("ReloadLuaFile", ":luafile %", {})
-- Git
user_cmd("CreateWorktree", ":lua require('telescope').extensions.git_worktree.create_git_worktree()", {})
user_cmd("ListWorktrees", ":lua require('telescope').extensions.git_worktree.git_worktrees()", {})
user_cmd("RefactorExtractBlock", " <Cmd>lua require('refactoring').refactor('Extract Block')<CR>", {})
user_cmd("RefactorExtractBlockToFile", "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",{})
user_cmd("RefactorInlineVariable", "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", {})

