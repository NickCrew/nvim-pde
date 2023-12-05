-- after/plugin/ui.lua
--
-- These are UI changes that must take place after all plugins
-- are loaded. (e.g., Diagnostics, signs, highlights, etc.)
--


----------------------------------------
-- Diagnostics
----------------------------------------
local lsp = vim.lsp
local _border = "single"

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  float = {
    header = false,
    border = 'rounded',
    focusable = true
  }
})


----------------------------------------
-- LSP Handlers
----------------------------------------
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  border = _border })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
  border = _border })
  local icons = require("settings._icons")


----------------------------------------
-- Signs
----------------------------------------
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

----------------------------------------
-- Kind
----------------------------------------
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

