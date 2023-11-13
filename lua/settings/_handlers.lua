
local lsp = vim.lsp
local handlers = lsp.handlers
local _border = "single"

handlers["textDocument/hover"] = lsp.with(handlers.hover, {
  border = _border })
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, {
  border = _border })
