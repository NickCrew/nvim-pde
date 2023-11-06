--------------------------------------------------
-- File: settings.mappings
-- Sourced Directly By: init.lua
-- Description: Core mappings, non-which-key, non-lazy etc.
--------------------------------------------------

local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

map("n", "<leader>-", "<cmd>Oil<cr>", opts)

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



-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize window using <ctrl> arrow keys
map("n", "<A-Up>", "<cmd>resize +3<cr>", opts)
map("n", "<A-Down>", "<cmd>resize -3<cr>", opts)
map("n", "<A-Left>", "<cmd>vertical resize -3<cr>", opts)
map("n", "<A-Right>", "<cmd>vertical resize +3<cr>", opts)

map("n", "<leader><tab>", "<cmd>b#<cr>", opts)
map("n", "<leader>'", "<cmd>noh<cr>", opts)
map("n", "<C-s>", "<cmd>w<cr>", opts)
