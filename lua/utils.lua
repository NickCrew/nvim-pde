local M = {}

function M.mk_abbrev(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

function M.mk_abr_cmd(abr, name, cmd, opts)
  vim.api.nvim_create_user_command(name, cmd, opts)
  M.mk_abbrev(abr, cmd)
end


return M
