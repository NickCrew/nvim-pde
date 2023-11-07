--
-- Abbreviations

local mk_abbrev = function(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end


mk_abbrev("T", "Telescope ")
mk_abbrev("Lr", "Lazy reload ")
mk_abbrev("Ws", "WeztermSpawn ")
