local M = {}

function M.mk_abr_cmd(abr, name, cmd)
  vim.api.nvim_create_user_command(name, cmd, {})
  vim.cmd{cmd = 'cnoreabbrev', args = {abr, cmd}}
end

function M.reload_user_cmds()
  local user_cmds =  require("user.cmds")
  for _, e  in pairs(user_cmds) do
    vim.api.nvim_create_user_command(e.name,e.command, e.opts)
    vim.cmd{cmd = 'cnoreabbrev', args = {e.abbrev, e.name}}
  end
end


return M
