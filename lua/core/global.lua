-- Global Variables

local g = vim.g

-- Map leader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- Global Variables
g.python3_host_prog = os.getenv('HOME') .. '/.pyenv/versions/neovim/bin/python'
g.fern_disable_startup_warnings = true

-- Plugin Global Variables
g.cursorhold_updatetime = 100 -- plugin: fix-cursorhold


local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

function _G.set_terminal_keymaps()
  bufmap(0, "t", "<esc>", [[<C-\><C-n>]], { noremap = true })
  bufmap(0, "t", "jk", [[<C-\><C-n>]], { noremap = true })
  bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true })
  bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true })
  bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true })
  bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true })
end


function _G.set_nav_keymaps()
  local opts = {silent = true, noremap=true}
  -- Quickly escape terminal
  -- map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)
  -- Center screen after jumping to search results
  map("n", "N", "Nzz", opts)
  map("n", "n", "nzz", opts)
  -- Quicker window switching
  map("n", "<C-h>", "<C-w><C-h>", opts)
  map("n", "<C-j>", "<C-w><C-j>", opts)
  map("n", "<C-k>", "<C-w><C-k>", opts)
  map("n", "<C-l>", "<C-w><C-l>", opts)
  -- Switch windows and maximize
  map("n", "<M-left>", "<C-w>h<C-w>|", opts)
  map("n", "<M-right>", "<C-w>l<C-w>|", opts)
  map("n", "<M-down>", "<C-w>j<C-w>_", opts)
  map("n", "<M-up>", "<C-w>k<C-w>_", opts)
  -- kill it with fire
  map("n", "q:", "<nop>", opts)
  map("n", "Q", "<nop>", opts)
end



