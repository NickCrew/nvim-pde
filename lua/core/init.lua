
local g = vim.g
local utils = require('core.utils')
utils.disable_builtins()

require('core.autocmds')
require('core.global')
require('core.options')
require('core.abbrev')
require('core.usercmds')

 vim.cmd([[call darkmodesocket#updateTheme()]])



