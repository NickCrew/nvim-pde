
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Eliminate Dumbness
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

-- Yank to void buffer
map("n", "<leader><leader>x", '"_x', opts)
map("n", "<leader><leader>y", '"_y', opts)
map("n", "<leader><leader>d", '"_dd', opts)

-- Keep centered
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-S-h>", "<C-w>h", opts)
map("n", "<C-S-j>", "<C-w>j", opts)
map("n", "<C-S-k>", "<C-w>k", opts)
map("n", "<C-S-l>", "<C-w>l", opts)

-- Resize window using <ctrl> arrow keys
map("n", "<A-Right>", "<cmd>vertical resize +3<cr>", opts)
map("n", "<A-Up>", "<cmd>resize +3<cr>", opts)
map("n", "<A-Down>", "<cmd>resize -3<cr>", opts)
map("n", "<A-Left>", "<cmd>vertical resize -3<cr>", opts)


-- Last Buffer
map("n", "<leader><tab>", "<cmd>b#<cr>", opts)

-- Turn off search highlighting
map("n", "<leader>,", "<cmd>noh<cr>", opts)

-- Save
map("n", "<C-s>", "<cmd>w<cr>", opts)

-- Save all
map("n", "<C-s>s", "<cmd>wall<cr>", opts)

-- Save and quit all
map("n", "<C-s>q", "<cmd>wqall<cr>", opts)

-- Quit all without saving
map("n", "<C-s>s", "<cmd>!qall<cr>", opts)



