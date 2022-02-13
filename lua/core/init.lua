-- vim: foldmethod=marker
-- lua/core/init.lua
--

local utils = require('core.utils')
local vim = vim
local g = vim.g

-- Set leader key
local apply_leader_map = function()
  vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
  g.mapleader = " "
  g.maplocalleader = " "
end

-- Apply colorscheme and any aesthetic customizations
local configure_style = function()
  utils.transparency_highlights()
end


local M = {}

-- Load 'er up
function M.load()
  apply_leader_map()
  configure_style()

  require('core.global')
  require('core.options')
  require('plugins')
  require('core.mappings')
  vim.cmd([[call darkmodesocket#updateTheme()]])

end

return M

