-- file: after/plugin/usercmds.lua
-- description: loads commands created by the user last

local function mk_abr_cmd(abr, name, cmd, opts)
  vim.api.nvim_create_user_command(name, cmd, opts)
  vim.cmd{cmd = 'cnoreabbrev', args = {abr, cmd}}
end


local ok, user_cmds =  pcall(require, "settings.user.commands")
if not ok then
  print("Failed to load custom user commands.")
else
  for _, e  in pairs(user_cmds) do
    mk_abr_cmd(e.abbrev, e.name, e.command, e.opts)
  end
end




