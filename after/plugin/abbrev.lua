----------------------------------------
-- Abbreviations
----------------------------------------
local function mkabr(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

mkabr("T", "Telescope ")
mkabr("Lr", "Lazy reload ")
mkabr("L", "Lazy")

