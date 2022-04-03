
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

local transparency = false
if os.getenv("ITERM_PROFILE") == "Hotkey" then
  transparency = true
  opt.background = 'dark'
elseif os.getenv("ITERM_PROFILE") == "Dark" then
  opt.background = 'dark'
else
  opt.background = 'dark'
end

local apply_highlights = function(full)
  if full == true then
    cmd([[highlight Normal guibg=none ctermbg=none]])
    cmd([[highlight LineNr guibg=none ctermbg=none]])
    cmd([[highlight SignColumn guibg=none ctermbg=none]])
  end
  cmd([[highlight Folded guibg=none ctermbg=none]])
  cmd([[highlight FloatBorder guibg=none ctermbg=none]])
end

local bones = function()
  return {
    lightness = nil,
    darken_noncurrent_window = true,
    solid_float_border = true,
    solid_vert_split = true,
    transparent_background = transparency
  }
end

g.rosebones = bones
g.forestbones = bones

cmd([[call darkmodesocket#updateTheme()]])

apply_highlights(transparency)

