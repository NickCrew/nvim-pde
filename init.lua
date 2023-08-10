-- init.lua
--

local vim = vim


require('settings.autocmd')
require('settings.usercmd')
require('settings.options')
require('plugins')
require('keymaps')
require('keymaps.wk')


vim.cmd("colorscheme tokyonight-moon")
