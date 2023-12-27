
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


local icons = {
  error       = " ",
  warning     = " ",
  information = " ",
  other       = " ",
  hint        = " ",
}

for type, icon in pairs({
  DiagnosticSignError       = icons.error,
  DiagnosticSignWarning     = icons.warning,
  DiagnosticSignWarn        = icons.warning,
  DiagnosticSignHint        = icons.hint,
  DiagnosticSignInformation = icons.information,
  DiagnosticSignInfo        = icons.information,
}) do
  vim.fn.sign_define(type, {
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end
