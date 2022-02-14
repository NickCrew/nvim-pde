
local theme_name = 'rose-pine'

local iterm_profile = os.getenv('ITERM_PROFILE')
if iterm_profile == 'Light'  then
  vim.opt.background = 'light'
else
  vim.opt.background = 'dark'
end


local theme_cmd = 'colorscheme ' .. theme_name
vim.cmd(theme_cmd)

if iterm_profile == 'Hotkey' then
  vim.cmd([[highlight Normal guibg=none ctermbg=none]])
  vim.cmd([[highlight LineNr guibg=none ctermbg=none]])
  vim.cmd([[highlight Folded guibg=none ctermbg=none]])
  vim.cmd([[highlight SignColumn guibg=none ctermbg=none]])
end
