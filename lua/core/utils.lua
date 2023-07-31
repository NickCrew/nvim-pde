local vim = vim
local execute = vim.api.nvim_cmd

local M = {}

function M.mk_abbrev(abbrev, command)
  execute({ cmd = "cnoreabbrev",
  args = {abbrev, command}},
  {})
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

function M.disable_builtins()
  local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
  }
  for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
  end
end


return M
