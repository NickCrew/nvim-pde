-- lua/core/utils.lua
--

local M = {}

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
