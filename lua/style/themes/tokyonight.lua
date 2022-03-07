
local M = {}

function M.set_tokyonight_gvars(is_transparent)
  if is_transparent == nil then
    is_transparent = false
  end
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_italic_keywords = true
  vim.g.tokyonight_italic_comments = false
  vim.g.tokyonight_lualine_bold = true
  vim.g.tokyonight_terminal_colors = true
  vim.g.tokyonight_hide_inactive_statusline = false
  vim.g.tokyonight_dark_float = true
  vim.g.tokyonight_dark_sidebar = true
  vim.g.tokyonight_sidebars = { "qf", "NvimTree", "terminal", "packer", }

  vim.g.tokyonight_transparent = is_transparent
  vim.g.tokyonight_transparent_sidebar = true

end

return M
