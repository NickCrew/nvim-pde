
-- 
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local wk = require('which-key')

-- Remaps
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

-- Center Cursor
map("n", "<leader>;", "zz", opts)
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

map("n","<C-h>", "<C-w>h", opts)
map("n","<C-j>", "<C-w>j", opts)
map("n","<C-k>", "<C-w>k", opts)
map("n","<C-l>", "<C-w>l", opts)

-- Last Buffer
map("n", "<leader><tab>", "<cmd>b#<cr>", opts)

-- Search Highlighting
map("n", "<leader>,", "<cmd>noh<cr>", opts)
map("n", "<leader><leader>;", "<cmd>noh<cr>", opts)

-- Saving and Closing
map("n", "<C-s>", "<cmd>w<cr>", opts)          -- Save
map("n", "<C-s><C-a>", "<cmd>wall<cr>", opts)  -- Save all
map("n", "<C-s><C-s>", "<cmd>wqall<cr>", opts) -- Save all and quit
map("n", "<C-s>a", "<cmd>!qall<cr>", opts)     -- Quit all without saving

-- Yank to void buffer
map("n", "<leader><leader>x", '"_x', opts)
map("n", "<leader><leader>y", '"_y', opts)
map("n", "<leader><leader>d", '"_dd', opts)

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm<cr>", opts)

map("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})                -- restore the session for the current directory
map("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {}) -- restore the last session
map("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})                -- stop Persistence => session won't be saved on exit

map("n", "<leader><leader>rl", "<cmd>ReloadLuafile<cr>", opts)

map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-l>", "<C-w>l", opts)

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
