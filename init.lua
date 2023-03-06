-- init.lua
--

local utils = require('utils')

require('global')
require('cmds')
require('options')
require('plugins')
require('mappings')

vim.cmd([[call darkmodesocket#updateTheme()]])


