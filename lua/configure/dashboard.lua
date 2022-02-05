local dashboard = require("alpha.themes.dashboard")

-- Set header choice
dashboard.section.header.val = require("core.extras.ascii-art").default_header
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
