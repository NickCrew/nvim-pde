local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Terminal Keymaps
-- LSP Keymaps

-- SANE DEFAULTS
map("", "<Space>", "<Nop>", opts) -- Disable default space

-- NAVIGATION
map("n", "N", "Nzz", opts)        -- Center cursor on N
map("n", "n", "nzz", opts)        -- Center cursor on n

-- SWITCH WINDOWS AND BUFFERS
map("n", "<A-h>", "<C-w>h", opts)              -- Move to window left
map("n", "<A-j>", "<C-w>j", opts)              -- Move to window down
map("n", "<A-k>", "<C-w>k", opts)              -- Move to window up
map("n", "<A-l>", "<C-w>l", opts)              -- Move to window right
map("n", "<leader><tab>", "<cmd>b#<cr>", opts) -- Go to last buffer
map("n", "<leader>,", "<cmd>noh<cr>", opts)    -- Disable search highlights

-- SAVING AND CLOSING
map("n", "<C-s>", ":w<cr>", opts)          -- Save
map("n", "<C-s><C-s>", ":wa<cr>", opts)  -- Save all
map("n", "<C-s><C-a>", ":qa!<cr>", opts)     -- Quit all without saving

-- CLIPBOARD, YANKING, AND PASTING
map("n", "<leader><leader>x", '"_x', opts)  -- Delete without yanking
map("n", "<leader><leader>d", '"_dd', opts) -- Delete without yanking
map("v", "<leader><leader>y", '"_y', opts)  -- Yank without copying to clipboard
map("v", "<leader>Y", '"*y', opts)          -- Yank to system clipboard
map("n", "<leader>P", '"*p', opts)          -- Paste from system clipboard

