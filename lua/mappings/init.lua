-- lua/mappings/init.lua

local map = vim.api.nvim_set_keymap

-- Center screen after jumping to search results
map("n", "N", "Nzz", { noremap = true, silent = true })
map("n", "n", "nzz", { noremap = true, silent = true })
-- Quicker window switching
map("n", "<C-h>", "<C-w><C-h>", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w><C-j>", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w><C-k>", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w><C-l>", { noremap = true, silent = true })
-- Switch windows and maximize
map("n", "<M-left>", "<C-w>h<C-w>|", { noremap = true, silent = true })
map("n", "<M-right>", "<C-w>l<C-w>|", { noremap = true, silent = true })
map("n", "<M-down>", "<C-w>j<C-w>_", { noremap = true, silent = true })
map("n", "<M-up>", "<C-w>k<C-w>_", { noremap = true, silent = true })
-- kill it with fire
map("n", "q:", "<nop>", { noremap = true, silent = true })
map("n", "Q", "<nop>", { noremap = true, silent = true })


-- Register mappings with WhichKey
require("mappings.wk") 
