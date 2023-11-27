
local M = {}

M.npde_mk_abbrev = function(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

return M
