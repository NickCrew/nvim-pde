-- Mappings

local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }



-- Eliminate Dumbness
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)
-- Keep centered
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)
-- Handy Maximized Window Nav
map("n", "<M-left>", "<C-w>h<C-w>|", opts)
map("n", "<M-right>", "<C-w>l<C-w>|", opts)
map("n", "<M-down>", "<C-w>j<C-w>_", opts)
map("n", "<M-up>", "<C-w>k<C-w>_", opts)
map("n", "-", "<cmd>Oil<cr>", opts)
