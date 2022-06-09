-- lua/core/utils.lua
--

local vim = vim
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local M = {}

function M.is_module_available(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == "function" then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
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

function M.load_usercmds()
  require('core.utils.usercmds')
end


return M
