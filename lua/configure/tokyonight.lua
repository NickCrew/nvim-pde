-- lua/configure/tokyonight.lua

local vim = vim

local M = {}

function M.load_theme(transparency_enabled, colors)
  -- Example config in Lua
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_italic_keywords = true
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_lualine_bold = true
  vim.g.tokyonight_terminal_colors = true
  vim.g.tokyonight_dark_float = true
  vim.g.tokyonight_hide_inactive_statusline = true

  if colors ~= nil then
    vim.go.tokyonight_colors = colors
  end

  -- Transparency
  if transparency_enabled == nil then
    vim.g.tokyonight_transparent = false
    vim.g.tokyonight_transparent_sidebar = false
  else
    vim.g.tokyonight_transparent = transparency_enabled
    vim.g.tokyonight_transparent_sidebar = transparency_enabled
    require('core.utils').apply_transparency()
  end

  -- Load the colorscheme
  vim.cmd([[colorscheme tokyonight]])
end

return M
