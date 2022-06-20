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

usercmd("Envv",
  "Telescope env", {})

usercmd("Gstat",
  "Telescope git_status", {})

usercmd("Gbranch",
  "Telescope git_branch", {})

usercmd("Proj",
  "Telescope projects", {})

usercmd("Fmt",
  "lua vim.lsp.buf.format({async = true})", {})

usercmd("Halp",
  "help halp<cr>", {})

usercmd("Hmark",
  "lua require('harpoon.mark').add_file()", {})

usercmd("DocFu",
  "<ESC>:Neogen func", {})

usercmd("DocCl",
  "<ESC>:Neogen class", {})

usercmd("OpDap",
  "lua require('dapui).open()", {})

usercmd("CoDap",
  "lua require('dapui).close()", {})

-- stylua: ignore end

