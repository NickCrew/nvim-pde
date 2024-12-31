
local M = {}

M.update_theme = function(dark_theme, light_theme)
  local defaults = vim.g.PREFS.ui.colorscheme
  local isdark = vim.fn.system("isdark")
  local theme = defaults.dark
  local bg = "dark"

  if not isdark == 1 then
    bg = "light"
    if light_theme then
      theme = light_theme
    else
      theme = defaults.light
    end
  else
    if dark_theme then theme = dark_theme end
  end

  vim.opt.background = bg
  vim.opt.laststatus = 3
  vim.cmd("colorscheme " .. theme)
end


return M
