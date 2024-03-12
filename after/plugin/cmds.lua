-- User commands
local usercmd = vim.api.nvim_create_user_command

-- Reload lua file
usercmd("ReloadLuafile", "luafile %", {})
-- Toggle Quickfix 

