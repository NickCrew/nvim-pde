local M = {}

M.ICONS = require("settings._icons")

M.load = function()
  require("settings.global")
  require("settings.autocmds")
  require("settings.options")
  require("settings.plugins")
  require("settings.mappings")
end

return M
