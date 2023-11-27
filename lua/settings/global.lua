-- Inclued by lua/settings/init
--
local g = vim.g

-- Mapleader
g.mapleader = " "
g.maplocalleader = "\\"
-- UI
g.cursorhold_updatetime = 100
-- Runtime
g.nvim_cache            = os.getenv('HOME') .. "/.cache/nvim"
g.python3_host_prog     = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'


