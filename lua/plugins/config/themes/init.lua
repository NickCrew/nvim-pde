
local tokyonight = require('configure.themes.tokyonight')

local M = {}

function M.load_theme(theme_name, style, transparency)
  if style == nil then
    style = 'dark'
  end

  if transparency == nil then
    transparency = false
  end

  if theme_name == "tokyonight" then
    tokyonight.configure_tokyonight_theme(style, transparency)
  end
end


return M


