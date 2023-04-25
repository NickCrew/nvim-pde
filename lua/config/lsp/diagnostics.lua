local vim = vim
local diagnostic = vim.diagnostic
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

diagnostic.config({
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
