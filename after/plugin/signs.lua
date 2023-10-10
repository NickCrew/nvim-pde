
local icons = require("settings._icons")

for type, icon in pairs({
  DapBreakpoint             = icons.dap.normal,
  DapBreakpointCondition    = icons.dap.conditional,
  DapBreakpointRejected     = icons.dap.rejected,
  DapLogPoint               = icons.dap.log,
  DapStopped                = icons.dap.stopped,
  DiagnosticSignError       = icons.diagnostics_fancy.error,
  DiagnosticSignWarning     = icons.diagnostics_fancy.warning,
  DiagnosticSignWarn        = icons.diagnostics_fancy.warning,
  DiagnosticSignHint        = icons.diagnostics_fancy.hint,
  DiagnosticSignInformation = icons.diagnostics_fancy.information,
  DiagnosticSignInfo        = icons.diagnostics_fancy.information ,
}) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end
