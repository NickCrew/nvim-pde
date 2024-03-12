
----------------
-- Diagnostics
--


---------------
-- Highlights
--
local highlights = {
  CmpItemKindCopilot = '#6CC644',
  CmpItemMenu        = '#6D7084'
}
for hl, col in pairs(highlights) do
  vim.api.nvim_set_hl(0, hl, { fg = col })
end



----------------
-- Signs & Icons
--
local icons = _G.get_icons()
local signs = {
  DapBreakpoint             = icons.dap.Breakpoint,
  DapBreakpointCondition    = icons.dap.BreakpointConditional,
  DapBreakpointRejected     = icons.dap.BreakpointRejected,
  DapLogPoint               = icons.dap.BreakpointLog,
  DapStopped                = icons.dap.BreakpointStopped,
  DiagnosticSignError       = icons.diagnostics.BoldError,
  DiagnosticSignWarning     = icons.diagnostics.BoldWarning,
  DiagnosticSignWarn        = icons.diagnostics.BoldWarning,
  DiagnosticSignHint        = icons.diagnostics.BoldHint,
  DiagnosticSignInformation = icons.diagnostics.BoldInformation,
  DiagnosticSignInfo        = icons.diagnostics.BoldInformation
}
for type, icon in pairs(signs) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end
