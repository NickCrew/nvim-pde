
local vim = vim




if os.getenv('ITERM_PROFILE') == 'Hotkey' then
  local fox = require('style.themes.fox').fox_setup('duskfox', true)
  fox.load()
elseif os.getenv('ITERM_PROFILE') ~= nil then
  vim.cmd([[call darkmodesocket#updateTheme()]])
else
  --require('style.themes.tokyonight')
  local fox = require('style.themes.fox').fox_setup()
  fox.load()
end
require('style.highlights')

