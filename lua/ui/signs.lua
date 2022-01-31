-- 


local diagnostic_signs = {
  Error = ' ',
  Warning = " ",
  Warn = " ",
  Hint = " ",
  Information = " ",
  Info = " ",
}

local dap_signs = {
  Breakpoint = "🟠",
  BreakpointCondition = "🔵",
  BreakpointRejected = "⭕",
  LogPoint = "🔶",
  Stopped = "🛑",
}

-- DAP Signs
for type, icon in pairs(dap_signs) do
  local highlight = "Dap" .. type
  vim.fn.sign_define(
    highlight,
    { text = icon, texthl = "", numhl = "" }
  )
end


-- Diagnostic Signs
for type, icon in pairs(diagnostic_signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(
    highlight,
    { text = icon, texthl = highlight, numhl = "" }
  )
end




