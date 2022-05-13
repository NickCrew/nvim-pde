local fn = vim.fn
local cmd = vim.api.nvim_create_user_command

-- Formatting
cmd("Fmt", "lua vim.lsp.buf.format({async = true})", {})
-- Debug Adapter Protocol (DAP)
cmd("TestFunc", "lua require('dap-python').test_method()", {})
cmd("TestClass", "lua require('dap-python').test_class()", {})
cmd("DebugSelection", "<ESC>:lua require('dap-python').debug_selection()", {})
-- Telescope Aliases
cmd("Halp", "help halp<cr>", {})
cmd("Envv", "Telescope env", {})
cmd("Gstat", "Telescope git_status", {})
cmd("Gbranch", "Telescope git_branch", {})
cmd("Proj", "Telescope projects", {})
cmd("Hmark", "lua require('harpoon.mark').add_file()", {})
