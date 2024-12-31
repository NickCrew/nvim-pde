local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)


-- Defaults
map("n", "N", "Nzz", opts)                  -- Center cursor on N
map("n", "n", "nzz", opts)                  -- Center cursor on n
map("n", "<leader>,", "<cmd>noh<cr>", opts) -- Disable search highlights

-- Windows and buffers
map("n", "<A-h>", "<C-w>h", opts)              -- Move to window left
map("n", "<A-j>", "<C-w>j", opts)              -- Move to window down
map("n", "<A-k>", "<C-w>k", opts)              -- Move to window up
map("n", "<A-l>", "<C-w>l", opts)              -- Move to window right
map("n", "<leader><tab>", "<cmd>b#<cr>", opts) -- Go to last buffer

-- Save and quit
map("n", "<C-s>", ":w<cr>", opts)        -- Save
map("n", "<C-s><C-s>", ":wa<cr>", opts)  -- Save all
map("n", "<C-s><C-a>", ":qa!<cr>", opts) -- Quit all without saving

-- Void register
map("n", "<leader><leader>x", '"_x', opts)  -- Delete without yanking
map("n", "<leader><leader>d", '"_dd', opts) -- Delete without yanking
map("v", "<leader><leader>y", '"_y', opts)  -- Yank without copying to clipboard

-- System clipbord
map("v", "<leader>Y", '"*y', opts) -- Yank to system clipboard
map("n", "<leader>P", '"*p', opts) -- Paste from system clipboard
