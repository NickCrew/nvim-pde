-- Global Variables

local vim = vim
local g = vim.g
local bufmap = vim.api.nvim_buf_set_keymap
local map = vim.api.nvim_set_keymap

local home = os.getenv('HOME')


g.python_bin_dir = home .. '/.pyenv/versions/neovim/bin'
g.python3_host_prog = g.python_bin_dir .. '/python'

g.fern_disable_startup_warnings = true
g.cursorhold_updatetime = 100 


map("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

function _G.set_terminal_keymaps()
  bufmap(0, "t", "<esc>", [[<C-\><C-n>]], { noremap = true })
  bufmap(0, "t", "jk", [[<C-\><C-n>]], { noremap = true })
  bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true })
  bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true })
  bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true })
  bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true })
end


