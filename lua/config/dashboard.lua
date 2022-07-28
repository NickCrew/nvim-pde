-- lua/configure/dashboard.lua
--


local opts = {}
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.buttons.val =
{
  dashboard.button("f f", "  > Find File", ":Telescope find_files<CR>", opts),
  dashboard.button("f p", "  > Find Project", ":Telescope projects<CR>", opts),
  dashboard.button("z d", "  > File Browser", ":Telescope file_browser<CR>", opts),
  dashboard.button("f g", "  > Search in Files", ":Telescope live_grep<CR>", opts),
  dashboard.button("u", "  > Update plugins", ":PackerSync<CR>", opts),
  dashboard.button("e", "  > New file", ":enew <CR>", opts),
  dashboard.button("q", "  > Quit NVIM", ":qa<CR>", opts),
}

dashboard.section.footer.val = require('alpha.fortune')
require('alpha').setup(dashboard.opts)
