local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

-- Remaps
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

map("n", ";j", "<cmd>HopWordCurrentLine<cr>", opts)
map("n", ";l", "<cmd>HopLine<cr>",opts)

-- Center Cursor
map("n", "<leader>;", "zz", opts)
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

-- Yank to void buffer
map("n", "<leader><leader>x", '"_x', opts)
map("n", "<leader><leader>y", '"_y', opts)
map("n", "<leader><leader>d", '"_dd', opts)


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
map("n", "<C-g>lr", "luafile %", opts)         -- Reload lua file

-- Terminal
map("n", "<C-\\>", "ToggleTerm", opts)

function _G.set_terminal_keymaps()
  bufmap(0, "n", "<C-\\>", "ToggleTerm", opts)
  bufmap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "jk", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end


