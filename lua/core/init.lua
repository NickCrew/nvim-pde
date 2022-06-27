--
-- lua/core/init.lua
--
-- Initliazie core configuration



require('core.utils').disable_builtins()
require('core.autocmds')
require('core.usercmds')
require('core.global')
require('core.options')
require('core.signs')


