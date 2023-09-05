-- Mappings

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


map("", "<Space>", "<Nop>",           opts)
map("n", "N", "Nzz",                  opts)
map("n", "n", "nzz",                  opts)
map("n", "<C-d>", "<C-d>zz",          opts)
map("n", "<C-u>", "<C-u>zz",          opts)
map("n", "q:", "<nop>",               opts)
map("n", "Q", "<nop>",                opts)
map("n", "<M-left>", "<C-w>h<C-w>|",  opts)
map("n", "<M-right>", "<C-w>l<C-w>|", opts)
map("n", "<M-down>", "<C-w>j<C-w>_",  opts)
map("n", "<M-up>", "<C-w>k<C-w>_",    opts)

