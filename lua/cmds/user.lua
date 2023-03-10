-- User defined commands
local usercmd = vim.api.nvim_create_user_command
usercmd("TestFunc", "lua require('dap-python').test_method()", {})
usercmd("TestClass", "lua require('dap-python').test_class()", {})
usercmd("DebugSelection", "lua require('dap-python').debug_selection()", {})
usercmd("BreakpointToggle", "lua require('dap').toggle_breakpoint()", {})
usercmd("Debug", "lua require('dap').continue()", {})
usercmd("DapREPL", "lua require('dap').repl.open()", {})
usercmd("UpdateTheme", "lua require('core.utils').update_theme()", {})
usercmd("Fmt", "lua vim.lsp.buf.format()", {})
usercmd("Nwt", ":lua require('telescope').extensions.git_worktree.create_git_worktree()", {})
usercmd("Gwt", ":lua require('telescope').extensions.git_worktree.git_worktrees()", {})
usercmd("DapCmd", ":lua require('telescope').extensions.dap.commands()", {})
usercmd("ReloadLuafile", ":luafile %", {})


