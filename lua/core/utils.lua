-- lua/core/utils.lua
--

local prefs = require('preferences')
local vim = vim

local M = {}

function M.transparency_highlights()
   vim.cmd([[highlight Normal guibg=none ctermbg=none]])
   vim.cmd([[highlight LineNr guibg=none ctermbg=none]])
   vim.cmd([[highlight Folded guibg=none ctermbg=none]])
   vim.cmd([[highlight NonText guibg=none ctermbg=none]])
   vim.cmd([[highlight SpecialKey guibg=none ctermbg=none]])
   vim.cmd([[highlight VertSplit guibg=none ctermbg=none]])
   vim.cmd([[highlight NvimTreeVertSplit guibg=none ctermbg=none]])
   vim.cmd([[highlight SignColumn guibg=none ctermbg=none]])
   vim.cmd([[highlight EndOfBuffer guibg=none ctermbg=none]])
end



function M.apply_style()
  -- note this only works with iTerm. For other terminals, the fall-back theme is used
  local theme = prefs.appearance.theme.default
  local bg = prefs.appearance.default_style
  -- check for iTerm profile
  if os.getenv('ITERM_PROFILE') == 'Light' then
    bg = 'light'
    theme = prefs.appearance.theme.light
  elseif os.getenv('ITERM_RPOFILE') == 'Dark' then
    bg = 'dark'
    theme = prefs.appearance.theme.dark
  end
  -- apply settings
  vim.opt.background = bg
  if prefs.appearance.enable_transparency then
    M.transparency_highlights()
  end
  local theme_cmd = 'colorscheme ' .. theme
  vim.cmd(theme_cmd)
end



function M.resize_split(plus_or_minus)
    local vim = vim
    -- full height window height is screen height minus 3 for bufferline, status line, and command line
    local is_vert_split = vim.fn.winheight(vim.fn.winnr()) + 3 == vim.o.lines
    if is_vert_split then
      if plus_or_minus == "plus" then
        vim.cmd("vertical resize +3")
      else
        vim.cmd("vertical resize -3")
      end
    else
      if plus_or_minus == "plus" then
        vim.cmd("resize +3")
      else
        vim.cmd("resize -3")
      end
    end
end


return M
