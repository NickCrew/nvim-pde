local M = {}

function M.load_wk()
  require('settings.mappings.wk._ctrla')
  require('settings.mappings.wk._fkeys')
  require('settings.mappings.wk._leader')
  require('settings.mappings.wk._noprefix')
  require('settings.mappings.wk._leaderdub')
  require('settings.mappings.wk._semicolon')
  require('settings.mappings.wk._visual')
  require('settings.mappings.wk._comma')
end

return M
