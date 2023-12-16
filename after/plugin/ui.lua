-- after/plugin/ui.lua
--
-- These are UI changes that must take place after all plugins
-- are loaded. (e.g., Diagnostics, signs, highlights, etc.)
--

local lsp = vim.lsp
local _border = "single"
local hl = vim.api.nvim_set_hl
local icons = require("settings._icons")

----------------------------------------
-- Diagnostics
----------------------------------------
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
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
  DiagnosticSignError       = icons.diagnostics.solid.error,
  DiagnosticSignWarning     = icons.diagnostics.solid.warning,
  DiagnosticSignWarn        = icons.diagnostics.solid.warning,
  DiagnosticSignHint        = icons.diagnostics.solid.hint,
  DiagnosticSignInformation = icons.diagnostics.solid.information,
  DiagnosticSignInfo        = icons.diagnostics.solid.information ,
}) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end

----------------------------------------
-- Highlights
----------------------------------------
hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

