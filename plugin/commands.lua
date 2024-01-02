local abbrevs = {
  L = "Lazy",
  Lr = "Lazy reload ",
  RH = "resize +20",
  RV = "vertical resize +20",
  Rh = "resize -20",
  Rv = "vertical resize -20",
  T = "Telescope ",
  Rlr = "ReloadLuafile"
}
for abr, cmd in pairs(abbrevs) do
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end


local usercmd = vim.api.nvim_create_user_command

-- Update theme
usercmd("UpdateTheme", "lua require('settings.utils').update_theme()", {})
-- Reload lua file
usercmd("ReloadLuafile", "luafile %", {})
-- Toggle Quickfix 
usercmd("ToggleQF", "lua require('settings.utils').toggle_qf()", {})
-- Toggle Location List
usercmd("ToggleLL", "lua require('settings.utils').toggle_ll()", {})

