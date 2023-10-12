-- after/plugin/diagnostics.lua
-- 
-- Customizations for Neovim diagnostics



-- 
-- Commands
-- 
local mk_augroup = vim.api.nvim_create_augroup
local mk_aucmd = vim.api.nvim_create_autocmd

mk_augroup("CursorHold", {})
mk_aucmd("CursorHold", {group = "CursorHold", pattern = "*", command = "lua require('nvim-lightbulb').update_lightbulb()", })
mk_aucmd("CursorHoldI", {group = "CursorHold", pattern = "*", command = "lua require('nvim-lightbulb').update_lightbulb()", })
mk_aucmd("CursorHold", { group = "CursorHold", pattern = "*", command = 'lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})', })


--
-- Signs
-- 
local icons = require("settings._icons")
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
