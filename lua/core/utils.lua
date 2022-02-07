-- lua/core/utils.lua
--

local M = {}

function M.update_custom_help_tags()
  local custom_help = vim.fn.stdpath('config') .. '/doc/'
  vim.cmd([[:helptags custom_help]])
end

function M.apply_transparency()
  local vim = vim
   vim.cmd([[highlight Normal guibg=none ctermbg=none]])
   --vim.cmd([[highlight LineNr guibg=none ctermbg=none]])
   vim.cmd([[highlight Folded guibg=none ctermbg=none]])
   vim.cmd([[highlight NonText guibg=none ctermbg=none]])
   --vim.cmd([[highlight SpecialKey guibg=none ctermbg=none]])
   --vim.cmd([[highlight VertSplit guibg=none ctermbg=none]])
   vim.cmd([[highlight SignColumn guibg=none ctermbg=none]])
   --vim.cmd([[highlight EndOfBuffer guibg=none ctermbg=none]])
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
