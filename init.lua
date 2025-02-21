-- vim: set foldmethod=marker foldlevel=0 foldmarker={{{,}}} :
--/////////////////////////////////////////////////
--
-- Neovim Configuration - init.lua
--
--/////////////////////////////////////////////////


require("global")
require("autocmds")
require("options")
require("plugins")
require("mappings")

vim.g.update_theme('catppuccin', 'ayu-light')
