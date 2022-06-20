-- lua/configure/dashboard.lua
--



local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = require('ui.misc').dashboard_title
dashboard.section.buttons.val = {
  dashboard.button("f f", "  > Find File", ":Telescope find_files<CR>"),
  dashboard.button("f p", "  > Find Project", ":Telescope projects<CR>"),
  dashboard.button("z d", "  > Go To Folder", ":Telescope zoxide list<CR>"),
  dashboard.button("u", "  > Update plugins", ":PackerSync<CR>"),
  dashboard.button("e", "  > New file", ":enew <CR>"),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}
dashboard.section.footer.val = require('alpha.fortune')
require('alpha').setup(dashboard.opts)
