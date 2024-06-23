-- lua/settings/utils.lua
--
-- Helpers for applying the neovim configuration
--

local M = {}

M.update_theme = function(dark_theme, light_theme)
  local isdark = vim.fn.system("isdark")
  local theme = "kanagawa"
  local bg = "dark"

  if not isdark == 1 then
    bg = "light"
    if light_theme then
      theme = light_theme
    else
      theme = "dawnfox"
    end
  else
    if dark_theme then theme = dark_theme end
  end

  vim.opt.background = bg
  vim.opt.laststatus = 3
  vim.cmd("colorscheme " .. theme)
end


M.edit_config = function()
  vim.cmd("cd $HOME/.config/nvim")
  vim.cmd("edit $MYVIMRC")
  vim.cmd("cd -")
end



return M
