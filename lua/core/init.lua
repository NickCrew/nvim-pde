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
  g.loaded_gzip = true
  g.loaded_tar = true
  g.loaded_tarPlugin = true
  g.loaded_zip = true
  g.loaded_zipPlugin = true
  g.loaded_getscript = true
  g.loaded_getscriptPlugin = true
  g.loaded_vimball = true
  g.loaded_vimballPlugin = true
  g.loaded_matchit = true
  g.loaded_matchparen = true
  g.loaded_2html_plugin = true
  g.loaded_logiPat = true
  g.loaded_rrhelper = true
end

-- Set leader key
local apply_leader_map = function()
  vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
  g.mapleader = " "
  g.maplocalleader = " "
end

local set_appearance = function()
  require('configure.themes.tokyonight')

  vim.cmd([[colorscheme tokyonight]])

  if is_iterm then 
    utils.apply_transparency() 
  end
end


-- Load 'er up
local load_core = function()
  createdir()
  disable_distribution_plugins()
  apply_leader_map()

  require('core.options')

  vim.g.move_key_modifier = "S" -- Shift
  vim.g.glow_binary_path =  os.getenv("HOME").."/bin"

  require('core.plugins')
  require('core.mappings')

  set_appearance()

end

load_core()
