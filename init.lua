-- init.lua
--

require('autocmds')
require('settings')
require('plugins')
require('mappings')

vim.cmd([[call darkmodesocket#updateTheme()]])


