
local M = {}

-- Toggle Quickfix
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

-- Toggle Location List
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

-- Update theme
M.update_theme = function()
  local isdark = vim.fn.system("isdark")
  local theme = "catppuccin"
  local bg = "dark"

  if not isdark == 1 then
    theme = "catppuccin-macchiato"
    bg = "light"
  end

  vim.opt.background = bg
  vim.cmd("colorscheme ".. theme)
end


return M


