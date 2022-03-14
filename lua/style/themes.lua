
local vim = vim

local M = {}

function M.configure_tokyonight()
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

  if os.getenv('ITERM_PROFILE') == 'Hotkey' then
    vim.g.tokyonight_transparent = true
    vim.g.tokyonight_transparent_sidebar = true
  end

end

function M.update_theme()
  local iterm = os.getenv('ITERM_PROFILE')

    local fox = require('style.themes.fox').fox_setup('dawnfox', false)
    fox.load()


end

return M
