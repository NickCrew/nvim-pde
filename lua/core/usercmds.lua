
local fn = vim.fn
local cmd = vim.api.nvim_create_user_command

-- Formatting
cmd('Format',
  'lua vim.lsp.buf.formatting()',
  {}
)

-- Debug Adapter Protocol (DAP)
cmd('TestMethod',
  "<cmd>lua require('dap-python').test_method()<CR>",
  {}
)

cmd('TestClass',
  "<cmd>lua require('dap-python').test_class()<CR>",
  {}
)

cmd('DebugSelection',
    "<ESC>:lua require('dap-python').debug_selection()<CR>",
    {}
)




