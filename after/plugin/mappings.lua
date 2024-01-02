
-- 
local wk = require('which-key')
-- Tese are just labels
wk.register({
  ["<leader>"] = {
    F = { "<cmd>file<cr>", "File" },
    e = { name = "+explorer", },
    f = { name = "+find", d = { name = "+dap" } },
    b = { name = "+buffers", c = { name = "+close", }, },
    g = { name = "+git", b = { name = "+blame" }, s = { name = "+stage" }, r = { name = "+reset" } },
    n = { name = "+notifications", },
  },
  ["<C-t>"] = { name = "+trouble", }
}, { mode = "n", })


wk.register({
  ["<leader>"] = {

    b = {
      f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format Buffer' },
      d = { "<cmd>bdelete<cr>", "Delete Buffer" },
      D = { "<cmd>!bdelete<cr>", "Delete Buffer" },


    },
    t = {
      '<cmd>ToggleTerm<cr>', 'Toggle Terminal'
    },
    C  = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
   w = {
      name = "+workspace",
      a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Workspace Folder' },
      r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder' },
      l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List Workspace Folders' }
    },
  }
}, {
  mode = "n"
})
