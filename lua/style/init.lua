
local vim = vim
local theme_name = 'tokyonight'

vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_hide_inactive_statusline = false
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_sidebars = {
  "qf",
  "NvimTree",
  "terminal",
  "packer",
  "vista_kind"
}

local iterm_profile = os.getenv('ITERM_PROFILE')
if iterm_profile == 'Light'  then
  vim.opt.background = 'light'
else
  vim.opt.background = 'dark'
end


local theme_cmd = 'colorscheme ' .. theme_name
vim.cmd(theme_cmd)

if iterm_profile == 'Hotkey' then
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_transparent_sidebar = true

  vim.cmd([[highlight Normal guibg=none ctermbg=none]])
  vim.cmd([[highlight LineNr guibg=none ctermbg=none]])
  vim.cmd([[highlight Folded guibg=none ctermbg=none]])
  vim.cmd([[highlight SignColumn guibg=none ctermbg=none]])
end
