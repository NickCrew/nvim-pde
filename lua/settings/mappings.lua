
-- 
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remaps
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

-- Center Cursor
map("n", "<leader>;", "zz", opts)
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

-- Split Navigation
map("n","<c-h>", "<C-w>h", opts)
map("n","<c-j>", "<C-w>j", opts)
map("n","<c-k>", "<C-w>k", opts)
map("n","<c-l>", "<C-w>l", opts)

map("n","<A-h>", "<C-w>h", opts)
map("n","<A-j>", "<C-w>j", opts)
map("n","<A-k>", "<C-w>k", opts)
map("n","<A-l>", "<C-w>l", opts)

map("n","<A-Left>", "<C-w>h", opts)
map("n","<A-Down>", "<C-w>j", opts)
map("n","<A-Up>", "<C-w>k", opts)
map("n","<A-Right>", "<C-w>l", opts)




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

-- Session Management
map("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})                -- restore the session for the current directory
map("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {}) -- restore the last session
map("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})                -- stop Persistence => session won't be saved on exit

map("n", "<leader><leader>r", "<cmd>ReloadLuafile<cr>", opts)
map("n", "<leader>bd", "<cmd>!bdelete<cr>", opts)
map("n", "<leader><leader>t",  "<cmd>ToggleTerm<cr>", opts) -- Toggle Terminal
map("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)  -- Format buffer
map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)


