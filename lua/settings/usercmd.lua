
local mkusercmd = vim.api.nvim_create_user_command

mkusercmd("Format", "lua vim.lsp.buf.format()", {})
mkusercmd("BreakpointToggle", "lua require('dap').toggle_breakpoint()", {})
mkusercmd("Debug", "lua require('dap').continue()", {})
mkusercmd("DapREPL", "lua require('dap').repl.open()", {})
mkusercmd("DapCmds", ":lua require('telescope').extensions.dap.commands()", {})
