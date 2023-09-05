local sd = vim.fn.sign_define
local icons = require("settings.ui.icons")


for type, icon in pairs({
  DapBreakpoint             = icons.debug_breakpoints.normal,
  DapBreakpointCondition    = icons.debug_breakpoints.conditional,
  DapBreakpointRejected     = icons.debug_breakpoints.rejected,
  DapLogPoint               = icons.debug_breakpoints.log,
  DapStopped                = icons.debug_breakpoints.stopped,
  DiagnosticSignError       = icons.diagnostics.error,
  DiagnosticSignWarning     = icons.diagnostics.warning,
  DiagnosticSignWarn        = icons.diagnostics.warning,
  DiagnosticSignHint        = icons.diagnostics.hint,
  DiagnosticSignInformation = icons.diagnostics.information,
  DiagnosticSignInfo        = icons.diagnostics.information ,
}) do
  sd(type, { 
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end
