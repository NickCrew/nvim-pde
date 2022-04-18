
local g = vim.g

require('settings.autocmds')
require('settings.global')
require('settings.abbrev')
require('settings.options')
require('utils').disable_builtins()

vim.cmd([[call darkmodesocket#updateTheme()]])
require('settings.highlights')

