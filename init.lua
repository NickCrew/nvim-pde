-- init.lua
--
--


-- Load settings
require("settings.global")
require("settings.autocmds")
require("settings.options")
require("settings.lazy")      -- Load plugins
require("settings.mappings")
require("settings.abbrev")


require("settings.utils").update_theme()


