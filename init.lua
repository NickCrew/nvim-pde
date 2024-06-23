-- init.lua
--
--

local utils = require("settings.utils")

-- Load settings
require("settings.global")
require("settings.autocmds")
require("settings.options")
require("settings.lazy")
require("settings.mappings")
require("settings.abbrev")


utils.update_theme()


