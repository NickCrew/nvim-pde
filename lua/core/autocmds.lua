-- lua/core/cmds/auto.lua
--
-- Auto-Commands
-------------------------------------------------------------

local a = vim.api
local autocmd = a.nvim_create_autocmd
local augroup = a.nvim_create_augroup


-- stylua: ignore start


---------------------
-- grp: hover
---------------------
augroup("hover", {})

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

---------------------
-- grp: terms
---------------------
augroup("terms", {})

autocmd("termopen", {
  group = "terms",
  pattern = "term://*",
  command = "lua set_terminal_keymaps()",
})

-- stylua: ignore end
