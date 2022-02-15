-- lua/lsp/diagnostics.lua
--

local vim = vim

-- Signs
local signs = require('lsp.icons')
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = "" })
end

-- Config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Toggle
require('toggle_lsp_diagnostics').init({
  start_on = true
})
