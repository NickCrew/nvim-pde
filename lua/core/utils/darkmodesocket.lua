
local M = {}

function M.listen_for_lights()
  local pid = string(vim.fn.getpid())
  local socket_name = '/tmp/nvim/nvim' .. pid .. '.sock'
  vim.fn.mkdir('/tmp/nvim', 'p')
  vim.fn.call.serverstart(socket_name)
end

function M.update_theme()
  local is_dark = vim._system('isdark')
  if is_dark then
    vim.opt.background = 'dark'
  else
    vim.opt.background = 'light'
  end

  require('config.nightfox')
  vim.cmd("colorscheme dawnfox")

  require('core.highlights')

end

return M
