local M = {}

function M.load_wk()
  require('settings.user.mappings._ctrla')
  require('settings.user.mappings._fkeys')
  require('settings.user.mappings._leader')
  require('settings.user.mappings._noprefix')
  require('settings.user.mappings._leaderdub')
  require('settings.user.mappings._semicolon')
  require('settings.user.mappings._visual')
end

return M
