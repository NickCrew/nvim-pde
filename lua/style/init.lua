
local vim = vim


if os.getenv('KITTY_STYLE') ~= nil then
  vim.opt.background = os.getenv('KITTY_STYLE')
  vim.cmd([[colorscheme rose-pine]])
else
  vim.cmd([[call darkmodesocket#updateTheme()]])
end

vim.cmd([[highlight Folded guibg=none ctermbg=none]])

if os.getenv('ITERM_PROFILE') == 'Hotkey' then
  vim.cmd([[highlight Normal guibg=none ctermbg=none]])
  vim.cmd([[highlight LineNr guibg=none ctermbg=none]])
  vim.cmd([[highlight SignColumn guibg=none ctermbg=none]])
end
