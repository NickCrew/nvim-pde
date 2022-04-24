
local fn = vim.fn
local cmd = vim.api.nvim_create_user_command

cmd('Format',
  'lua vim.lsp.buf.formatting()',
  {}
)




