
local vim = vim

vim.cmd([[call darkmodesocket#updateTheme()]])

if os.getenv('ITERM_PROFILE') == 'Hotkey' then
  vim.cmd([[highlight Normal guibg=none ctermbg=none]])
  vim.cmd([[highlight LineNr guibg=none ctermbg=none]])
  vim.cmd([[highlight Folded guibg=none ctermbg=none]])
  vim.cmd([[highlight SignColumn guibg=none ctermbg=none]])
end
