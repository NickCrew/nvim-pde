-- Global variables

local g = vim.g

-- Map leader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
g.mapleader = " "
g.maplocalleader = " "


-- Misc. Plugins
g.python3_host_prog = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'
g.cursorhold_updatetime = 100

g.tokyonight_italic_functions = true
g.tokyonight_italic_keywords = true
g.tokyonight_italic_comments = true
g.tokyonight_lualine_bold = true
g.tokyonight_terminal_colors = true
g.tokyonight_hide_inactive_statusline = false
g.tokyonight_dark_float = true
g.tokyonight_dark_sidebar = true
g.tokyonight_sidebars = { "qf", "neo-tree", "terminal", "packer", }
g.tokyonight_transparent = true
g.tokyonight_transparent_sidebar = true


