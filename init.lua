-- init.lua
--

local utils= require("utils")

utils.disable_builtins()

require('global')
require('cmds')
require('options')
require('plugins')
require('mappings')

utils.update_theme()

