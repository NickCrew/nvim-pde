-- lua/configure/dashboard.lua
--

local neovim_header_1 = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

local tx_header_1 = {
  "   ________                    __ _  __",
  " /_  __/ /_  ________  ____ _/ /| |/ /",
  "  / / / __ \\/ ___/ _ \\/ __ `/ __/   / ",
  " / / / / / / /  /  __/ /_/ / /_/   |  ",
  "/_/ /_/ /_/_/   \\___/\\__,_/\\__/_/|_|"
}


local tx_header_2 = {
"                                                           ",
" ████████╗██╗  ██╗██████╗ ███████╗ █████╗ ████████╗██╗  ██╗",
" ╚══██╔══╝██║  ██║██╔══██╗██╔════╝██╔══██╗╚══██╔══╝╚██╗██╔╝",
"    ██║   ███████║██████╔╝█████╗  ███████║   ██║    ╚███╔╝ ",
"    ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══██║   ██║    ██╔██╗ ",
"    ██║   ██║  ██║██║  ██║███████╗██║  ██║   ██║   ██╔╝ ██╗",
"    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝",
"                                                           "
}

local tx_header_3 = {
"  _______ _                    _  __   __      ",
" |__   __| |                  | | \\ \\ / /    ",
"    | |  | |__  _ __ ___  __ _| |_ \\ V /      ",
"    | |  | '_ \\| '__/ _ \\/ _` | __| > <      ",
"    | |  | | | | | |  __/ (_| | |_ / . \\      ",
"    |_|  |_| |_|_|  \\___|\\__,_|\\__/_/ \\_\\ ",
"                                               "
}



local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = neovim_header_1
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
