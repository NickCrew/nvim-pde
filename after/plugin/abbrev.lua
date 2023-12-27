----------------------------------------
-- Abbreviations
----------------------------------------
local function mkabr(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

mkabr("T", "Telescope ")
mkabr("Lr", "Lazy reload ")
mkabr("L", "Lazy")
mkabr("RV", "vertical resize +20")
mkabr("Rv", "vertical resize -20")
mkabr("RH", "resize +20")
mkabr("Rh", "resize -20")


