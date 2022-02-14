-- vim: foldmethod=marker
-- lua/core/init.lua
--

local utils = require('core.utils')
local prefs = require('preferences')
local vim = vim
local g = vim.g

local set_global_variables = function()
  g.python3_host_prog = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'
  g.cursorhold_updatetime = 100
end

-- Set space as leader key
local apply_leader_map = function()
  vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
end

local apply_styles = function()
  if os.getenv('ITERM_PROFILE') == 'Light' then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end

  local theme_cmd = 'colorscheme ' .. prefs.appearance.theme.default
  vim.cmd(theme_cmd)
end


local M = {}

-- Load 'er up
function M.load()
  apply_leader_map()  -- leader key needs to be set early
  set_global_variables()

  require('core.options')
  require('plugins')
  require('mappings')

  apply_styles()

end

return M

