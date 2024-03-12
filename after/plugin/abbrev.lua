-- Abbreviations
--
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


