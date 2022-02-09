-- lua/core/init.lua
--
local global = require('core.global')
local utils = require('core.utils')

local vim = vim
local g = vim.g

local is_iterm = os.getenv('TERM_PROGRAM') == 'iTerm.app'

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
  g.loaded_gzip = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1
  g.loaded_getscript = 1
  g.loaded_getscriptPlugin = 1
  g.loaded_vimball = 1
  g.loaded_vimballPlugin = 1
  g.loaded_matchit = 1
  g.loaded_matchparen = 1
  g.loaded_2html_plugin = 1
  g.loaded_logiPat = 1
  g.loaded_rrhelper = 1
  -- g.loaded_netrw = 1
  -- g.loaded_netrwPlugin = 1
  -- g.loaded_netrwSettings = 1
  -- g.loaded_netrwFileHandlers = 1

end

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
  if is_iterm then utils.apply_transparency() end
end

-- Global variables and options for Plugins
local apply_plugin_settings = function()
  g.move_key_modifier = "S" -- Shift
  g.glow_binary_path =  os.getenv("HOME").."/bin"
  g.cursorhold_updatetime = 100
end

local M = {}

-- Load 'er up
function M.load()
  createdir()
  disable_distribution_plugins()
  apply_leader_map()
  apply_plugin_settings()

  require('core.options')
  require('core.plugins')
  require('core.mappings')

  configure_look_and_feel()
end

return M

