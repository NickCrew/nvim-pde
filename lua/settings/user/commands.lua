return {
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
    abbrev = "DLS"
  },
}
