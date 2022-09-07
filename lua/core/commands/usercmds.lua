-- lua/core/cmds/user.lua
--
-- User-Defined Commands
-------------------------------------------------------------

local usercmd = vim.api.nvim_create_user_command

usercmd("TestFunc",
  "lua require('dap-python').test_method()", {})

usercmd("TestClass",
  "lua require('dap-python').test_class()", {})

usercmd("DebugSelection",
  "lua require('dap-python').debug_selection()", {})

usercmd("Fmt",
  "lua vim.lsp.buf.format({async = true})", {})

usercmd("Halp",
  "help halp<cr>", {})

usercmd("Launchjs", "lua require('dap.ext.vscode').load_launchjs()", {})

-- stylua: ignore end

