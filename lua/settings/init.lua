local M = {}

M.icons = function() 
  return require("settings._icons")
end

M.load = function()
  require("settings.autocmds")
  require("settings.commands")
  require("settings.options")
  require("settings.plugins")
  require("settings.mappings")
end

return M
