
local g = vim.g
-- Map leader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
g.mapleader = " "
g.maplocalleader = " "

-- Global Variables
g.python3_host_prog = os.getenv('HOME') .. '/.pyenv/versions/neovim/bin/python'

-- Plugin Global Variables
g.cursorhold_updatetime = 100 -- plugin: fix-cursorhold

-- Global Functions
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

