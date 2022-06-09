--
-- lua/core/init.lua
--
-- Initliazie core configuration

require('core.autocmds')

local utils = require('core.utils')
utils.disable_builtins()
utils.load_usercmds()

require('core.global')
require('core.options')
require('core.abbrev')
require('core.highlights')

 vim.cmd([[call darkmodesocket#updateTheme()]])



