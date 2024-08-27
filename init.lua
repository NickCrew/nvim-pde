-- Neovim configuration
--

require("settings.global") --  Global variables and functions 
require("settings.autocmds") -- Autocommands
require("settings.options") -- Options 
require("settings.lazy") -- Lazy load plugins
require("settings.mappings") -- Custom key mappings
require("settings.abbrevs") -- Abbreviations 
require("settings.highlights") -- highlighting groups 
vim.cmd("colorscheme tokyonight-moon") -- Set the theme 
-- That's it!

