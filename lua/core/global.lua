-- Global Variables

local g = vim.g

-- Map leader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
g.mapleader = " "
g.maplocalleader = " "

-- Global Variables
g.python3_host_prog = os.getenv('HOME') .. '/.pyenv/versions/neovim/bin/python'

-- Plugin Global Variables
g.cursorhold_updatetime = 100 -- plugin: fix-cursorhold


