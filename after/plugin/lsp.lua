local lsp = vim.lsp
local _border = "single"

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
  border = _border })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
  border = _border })


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


