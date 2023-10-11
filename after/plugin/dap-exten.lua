-- after/plugin/dap-exten
--
-- Customizations for debugging/DAP

local utils = require("utils")

-- 
-- Abbreviations
-- 
utils.mk_abbrev("T", "Telescope")

-- 
-- Commands
--
for _, e in pairs({
  {
    name = "ReloadLuaFile",
    command = ":luafile %",
    opts = {},
    abbrev = "Rlf"
  },
  {
    name = "FormatBuffer",
    command = "lua vim.lsp.buf.format()",
    opts = {},
    abbrev = "Fb"
  },
  {
    name = "DebugToggleBreakPoint",
    command = "lua require('dap').toggle_breakpoint()",
    opts = {},
    abbrev = "Dtbp"
  },
  {
    name = "DebugRun",
    command = "lua require('dap').continue()",
    opts = {},
    abbrev = "Dr"
  },
{
    name = "DebugConfigs",
    command = "<cmd>Telescope dap configurations<cr>",
    opts = {},
    abbrev = "Dc"
  },
  {
    name = "DebugConsole",
    command = "lua require('dap').repl.open()",
    opts = {},
    abbrev = "Dc"
  },
  {
    name = "DebugLsCommands",
    command = ":lua require('telescope').extensions.dap.commands()",
    opts = {},
    abbrev = "Dlc"
  },
  {
    name = "RefactorExtractBlock",
    command = "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
    opts = {},
    abbrev = "Reb"
  },
  {
    name = "RefactorExtractBlockToFile",
    command = "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
    opts = {},
    abbrev = "Rebtf"
  },
  {
    name = "RefactorInlineVariable",
    command = "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
    opts = {},
    abbrev = "Riv",
  },
  {
    name = "TestPyFunc",
    command = "<cmd>lua require('dap-python').test_method()<cr>",
    opts = {},
    abbrev = "Tpf"
  },
  {
    name = "TestPyClass",
    command = "<cmd>lua require('dap-python').test_class()",
    opts = {},
    abbrev = "Tpc"
  },
  {
    name = "DebugPySelection",
    command = "<Cmd>lua require('dap-python').debug_selection()<cr>",
    opts = {},
    abbrev = "Dps"
  }
}) do
  utils.mk_abr_cmd(e.abbrev, e.name, e.command, e.opts)
end


-- 
-- Signs
--
local icons = require("settings._icons")

for type, icon in pairs({
  DapBreakpoint             = icons.dap.normal,
  DapBreakpointCondition    = icons.dap.conditional,
  DapBreakpointRejected     = icons.dap.rejected,
  DapLogPoint               = icons.dap.log,
  DapStopped                = icons.dap.stopped,
}) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end


