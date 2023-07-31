-- Global Variables

local vim = vim
local g = vim.g

local home = os.getenv('HOME')

g.mapleader = " "
g.maplocalleader = "\\"

-- Paths
g.nvim_cache = home .. '/.cache/nvim'
g.python_bin_dir = home .. '/.pyenv/versions/neovim/bin'
g.python3_host_prog = g.python_bin_dir .. '/python'

-- Plugins
g.fern_disable_startup_warnings = true
g.cursorhold_updatetime = 100 

