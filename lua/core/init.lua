-- lua/core/init.lua
--
local global = require('core.global')
local utils = require('core.utils')
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
  local data_dir = {
    global.cache_dir .. "backup",
    global.cache_dir .. "session",
    global.cache_dir .. "swap",
    global.cache_dir .. "tags",
    global.cache_dir .. "undo",
  }
  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute("mkdir -p " .. global.cache_dir)
    for _, v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end
end

-- Disable unneeded distribution plugins
local disable_distribution_plugins = function()
  vim.g.loaded_gzip = true
  vim.g.loaded_tar = true
  vim.g.loaded_tarPlugin = true
  vim.g.loaded_zip = true
  vim.g.loaded_zipPlugin = true
  vim.g.loaded_getscript = true
  vim.g.loaded_getscriptPlugin = true
  vim.g.loaded_vimball = true
  vim.g.loaded_vimballPlugin = true
  vim.g.loaded_matchit = true
  vim.g.loaded_matchparen = true
  vim.g.loaded_2html_plugin = true
  vim.g.loaded_logiPat = true
  vim.g.loaded_rrhelper = true
end

-- Set leader key
local apply_leader_map = function()
  vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
end

-- Load 'er up
local load_core = function()
  createdir()
  disable_distribution_plugins()
  apply_leader_map()

  require('core.options')
  require('core.plugins')
  require('core.mappings')

  require('configure.tokyonight').load_theme(true)
end

load_core()
