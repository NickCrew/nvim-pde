local lsp = vim.lsp
local _border = "single"

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  border = _border })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
  border = _border })


