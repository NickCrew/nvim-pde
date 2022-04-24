local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local create_command = vim.api.nvim_create_user_command

augroup("packer_user_config", {})
cmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  group = "packer_user_config",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

augroup('hover', {})
cmd('CursorHold', 
{
  group = 'hover',
  pattern = '*',
  command = "lua require('nvim-lightbulb').update_lightbulb()"
})
cmd('CursorHoldI',
{
  group = 'hover',
  pattern = '*',
  command = "lua require('nvim-lightbulb').update_lightbulb()"
})
cmd('CursorHold',
{
  group = 'hover',
  pattern = '*',
  command = 'lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})'
})

-- -- Auto switch light/dark theme
-- augroup('startUp', {})
-- cmd('VimEnter', {
--     group = 'startUp',
--     pattern = '*',
--     command = "call darkmodesocket#updateTheme()"
-- })

-- Terminal settings
augroup('terms', {})
cmd('TermOpen', {
  group = 'terms',
  pattern = 'term://*',
  command = "lua set_terminal_keymaps()"
})
