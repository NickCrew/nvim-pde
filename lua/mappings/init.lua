-- Keymappings Configuration Initialization
--

--
-- Create and Register mappings with WhichKey
--
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require('mappings.wk')


-- Basic sanity preservation
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
map("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- kill it with fire
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

