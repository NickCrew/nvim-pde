vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
	},
})


local icons = require("settings.ui.icons")

for type, icon in pairs({
  DiagnosticSignError       = icons.diagnostics_fancy.error,
  DiagnosticSignWarning     = icons.diagnostics_fancy.warning,
  DiagnosticSignWarn        = icons.diagnostics_fancy.warning,
  DiagnosticSignHint        = icons.diagnostics_fancy.hint,
  DiagnosticSignInformation = icons.diagnostics_fancy.information,
  DiagnosticSignInfo        = icons.diagnostics_fancy.information ,
}) do
  vim.fn.sign_define(type, { 
    text = icon,
    texthl = "",
    numhl = "",
    linehl = ""
  })
end
