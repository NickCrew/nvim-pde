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



---------------------------------
-- Toggle Quickfix
--
M.toggle_qf = function()
	for _, info in ipairs(vim.fn.getwininfo()) do
		if info.quickfix == 1 then
			vim.cmd("cclose")
			return
		end
	end

	if next(vim.fn.getqflist()) == nil then
		print("qf list empty")
		return
	end
	vim.cmd("copen")
end

------------------------------
-- Toggle Location List
--
M.toggle_ll = function()
	for _, info in ipairs(vim.fn.getwininfo()) do
		if info.loclist == 1 then
			vim.cmd("lclose")
			return
		end
	end

	if next(vim.fn.getloclist(0)) == nil then
		print("loc list empty")
		return
	end
	vim.cmd("lopen")
end



return M


