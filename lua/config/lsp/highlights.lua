local vim = vim
local fn = vim.fn


for type, icon in pairs({
  Error = " ",
  Warning = " ",
  Warn = " ",
  Hint = " ",
  Information = " ",
  Info = " ",
}) do
  local highlight = "DiagnosticSign" .. type
  fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = "" })
end
