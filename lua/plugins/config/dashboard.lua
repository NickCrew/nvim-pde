-- lua/configure/dashboard.lua
--

local prefs = require('preferences')
local default_header = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}
local dashboard = require("alpha.themes.dashboard")

-- Set header choice
if prefs.appearance.dashboard.header == nil then
  dashboard.section.header.val = default_header
else
  dashboard.section.header.val = prefs.appearance.dashboard.header
end

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button("f f", "  > Find File", ":Telescope find_files<CR>"),
  dashboard.button("f p", "  > Find Project", ":Telescope projects<CR>"),
  dashboard.button("z d", "  > Go To Folder", ":Telescope zoxide list<CR>"),
  dashboard.button("u", "  > Update plugins", ":PackerSync<CR>"),
  dashboard.button("e", "  > New file", ":enew <CR>"),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}
-- Set footer
dashboard.section.footer.val = require('alpha.fortune')
require('alpha').setup(dashboard.opts)
