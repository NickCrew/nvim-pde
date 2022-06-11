--
-- lua/core/init.lua
--
-- Initliazie core configuration

local utils = require('core.utils')

require('core.autocmds')

utils.disable_builtins()
utils.load_usercmds()

require('core.global')
require('core.options')

require('core._abbrev')
require('core._ui')

 vim.cmd([[call darkmodesocket#updateTheme()]])



