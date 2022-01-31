-- init.lua
--


require('utils').disable_builtins()
require('core')
require('plugins')
require('mappings')
require('ui')

vim.cmd([[call darkmodesocket#updateTheme()]])
