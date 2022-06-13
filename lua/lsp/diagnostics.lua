-- lua/diagnostics.lua
--

local signs = {
  Error = ' ',
  Warning = ' ',
  Warn = ' ',
  Hint = ' ',
  Information = ' ',
  Info = ' ',
}

for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(
    highlight,
    { text = icon, texthl = highlight, numhl = "" }
  )
end

-- Toggle
require("toggle_lsp_diagnostics").init({
  start_on = true,
  underline = true,
  signs = true,
  virtual_text = false,
})
