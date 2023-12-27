
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remaps
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

map("n", ";j", "<cmd>HopWordCurrentLine<cr>",opts)
-- map("n", ";l", "<cmd>HopLine<cr>",opts)


-- Yank to void buffer
map("n", "<leader><leader>x", '"_x', opts)
map("n", "<leader><leader>y", '"_y', opts)
map("n", "<leader><leader>d", '"_dd', opts)

-- Center Cursor
map("n", "<leader>;", "zz", opts)
-- Last Buffer
map("n", "<leader><tab>", "<cmd>b#<cr>", opts)
-- Alt file
map("n", "<leader><leader><tab>", "<C-^>", opts)
-- Turn off search highlighting
map("n", "<leader>,", "<cmd>noh<cr>", opts)
map("n", "<leader><leader>;", "<cmd>noh<cr>", opts)
-- Save
map("n", "<C-s>", "<cmd>w<cr>", opts)
-- Save all
map("n", "<C-s><C-a>", "<cmd>wall<cr>", opts)
-- Save all and quit
map("n", "<C-s><C-s>", "<cmd>wqall<cr>", opts)
-- Quit all without saving
map("n", "<C-s>a", "<cmd>!qall<cr>", opts)
-- Reload lua file
map("n", "<C-g>lr", "luafile %", opts)



