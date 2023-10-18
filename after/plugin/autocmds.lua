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



