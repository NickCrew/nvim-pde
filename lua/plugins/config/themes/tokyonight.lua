-- lua/configure/tokyonight.lua

local vim = vim

local M = {}

function M.configure_tokyonight_theme(style, transparent)
  if style == nil then
    style = 'dark'
  end
  if transparent == nil then
    transparent = false
  end

  vim.g.tokyonight_style = style

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

  vim.g.tokyonight_transparent = transparent
  vim.g.tokyonight_transparent_sidebar = transparent

end


return M
