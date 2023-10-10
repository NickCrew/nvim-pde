-- file: after/plugin/usercmds.lua
-- description: loads commands created by the user last
--
local utils = require("utils")

local commands = {
  {
    name = "ReloadLuaFile",
    command = ":luafile %",
    opts = {},
    abbrev = "RLF"
  },
  {
    name = "FormatBuffer",
    command = "lua vim.lsp.buf.format()",
    opts = {},
    abbrev = "FB"
  },
  {
    name = "DebugToggleBreakPoint",
    command = "lua require('dap').toggle_breakpoint()",
    opts = {},
    abbrev = "DTBP"
  },
  {
    name = "DebugRun",
    command = "lua require('dap').continue()",
    opts = {},
    abbrev = "DR"
  },
  {
    name = "DebugConsole",
    command = "lua require('dap').repl.open()",
    opts = {},
    abbrev = "DC"
  },
  {
    name = "DebugLsCommands",
    command = ":lua require('telescope').extensions.dap.commands()",
    opts = {},
    abbrev = "DLC"
  },
  {
    name = "RefactorExtractBlock",
    command = "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
    opts = {},
    abbrev = "REB"
  },
  {
    name = "RefactorExtractBlockToFile",
    command = "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
    opts = {},
    abbrev = "REBTF"
  },
  {
    name = "RefactorInlineVariable",
    command = "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
    opts = {},
    abbrev = "RIV",
  },
  {
    name = "TestPyFunc",
    command = "<cmd>lua require('dap-python').test_method()<cr>",
    opts = {},
    abbrev = "TPF"
  },
  {
    name = "TestPyClass",
    command = "<cmd>lua require('dap-python').test_class()",
    opts = {},
    abbrev = "TPC"
  },
  {
    name = "DebugPySelection",
    command = "<Cmd>lua require('dap-python').debug_selection()<cr>",
    opts = {},
    abbrev = "DPS"
  }
}

for _, e in pairs(commands) do
  utils.mk_abr_cmd(e.abbrev, e.name, e.command, e.opts)
end
