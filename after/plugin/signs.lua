-- 
-- Signs
--
local icons = require("settings._icons")

for type, icon in pairs({
  -- DAP
  DapBreakpoint             = icons.dap.normal,
  DapBreakpointCondition    = icons.dap.conditional,
  DapBreakpointRejected     = icons.dap.rejected,
  DapLogPoint               = icons.dap.log,
  DapStopped                = icons.dap.stopped,
  -- Diagnostics
  DiagnosticSignError       = icons.diagnostics_solid.error,
  DiagnosticSignWarning     = icons.diagnostics_solid.warning,
  DiagnosticSignWarn        = icons.diagnostics_solid.warning,
  DiagnosticSignHint        = icons.diagnostics_solid.hint,
  DiagnosticSignInformation = icons.diagnostics_solid.information,
  DiagnosticSignInfo        = icons.diagnostics_solid.information ,
}) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end


