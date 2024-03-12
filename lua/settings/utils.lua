-- lua/settings/utils.lua
--



local M = {}

M.get_icons = function()
  return require("settings._icons")
end


---------------------------------
-- Update theme
--
M.update_theme = function(dark_theme, light_theme)
  local isdark = vim.fn.system("isdark")
  local theme = "carbonfox"
  local bg = "dark"

  if not isdark == 1 then
    bg = "light"
    if light_theme then theme = light_theme
    else theme = "dawnfox" end
  else
    if dark_theme then theme = dark_theme end
  end

  vim.opt.background = bg
  vim.cmd("colorscheme ".. theme)
end



return M


