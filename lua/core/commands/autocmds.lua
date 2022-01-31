-- lua/core/cmds/auto.lua
--
-- Auto-Commands
-------------------------------------------------------------

local a = vim.api
local autocmd = a.nvim_create_autocmd
local augroup = a.nvim_create_augroup

-- Groups
augroup("packer_user_config", {})
augroup("hover", {})
augroup("windows", {})
augroup("terms", {})

-- stylua: ignore start
autocmd("BufWritePost", {
  desc = "Auto Compile plugins.lua file",
  group = "packer_user_config",
  command = "source <afile> | PackerCompile",
  pattern = "plugins.lua",
})

autocmd('CursorHold',
{
  group = 'hover',
  pattern = '*',
  command = "lua require('nvim-lightbulb').update_lightbulb()"
})

autocmd('CursorHoldI',
{
  group = 'hover',
  pattern = '*',
  command = "lua require('nvim-lightbulb').update_lightbulb()"
})

autocmd('CursorHold',
{ -- Diagnostic pop-up on hover
  group = 'hover',
  pattern = '*',
  command = 'lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})'
})


autocmd("termopen", {
  group = "terms",
  pattern = "term://*",
  command = "lua set_terminal_keymaps()",
})

-- stylua: ignore end
