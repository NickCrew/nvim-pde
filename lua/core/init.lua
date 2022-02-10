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
local configure_look_and_feel = function()
  require('configure.themes.tokyonight')
  vim.cmd([[colorscheme tokyonight]])
  if os.getenv('TERM_PROGRAM') == 'iTerm.app' then
    utils.apply_transparency()
  end
end


local M = {}

-- Load 'er up
function M.load()
  apply_leader_map()

  require('core.global')
  require('core.options')
  require('core.plugins')
  require('core.mappings')

  configure_look_and_feel()
end

return M

