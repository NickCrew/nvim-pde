--------------------------------------------------
-- File: settings.mappings
-- Sourced Directly By: init.lua
-- Description: Core mappings, non-which-key, non-lazy etc.
--------------------------------------------------

local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Eliminate Dumbness
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

-- Keep centered
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

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

-- Last Buffer
map("n", "<leader><tab>", "<cmd>b#<cr>", opts)

-- Turn off search highlighting
map("n", "<leader>'", "<cmd>noh<cr>", opts)

-- Save
map("n", "<C-s>", "<cmd>w<cr>", opts)

-- Save all
map("n", "<C-s>s", "<cmd>wall<cr>", opts)

-- Save and quit all
map("n", "<C-s>q", "<cmd>wqall<cr>", opts)

-- Quit all without saving
map("n", "<C-s>s", "<cmd>!qall<cr>", opts)


local mk_abbrev = function(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

mk_abbrev("W!",   "w!")
mk_abbrev("W1",   "w!")
mk_abbrev("w1",   "w!")
mk_abbrev("Q!",   "q!")
mk_abbrev("Q1",   "q!")
mk_abbrev("q1",   "q!")
mk_abbrev("Qa",   "! qa!")
mk_abbrev("Qall", "! qall!")
mk_abbrev("Wa",   " wa")
mk_abbrev("Wq",   " wq")
mk_abbrev("wQ",   " wq")
mk_abbrev("WQ",   " wq")
mk_abbrev("wq1",  " wq!")
mk_abbrev("Wq1",  " wq!")
mk_abbrev("wQ1",  " wq!")
mk_abbrev("WQ1",  " wq!")
mk_abbrev("W",    "w")
mk_abbrev("Q",    "q")
mk_abbrev("Qa",   "qa")
mk_abbrev("Qall", "qall")
