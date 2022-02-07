-- lua/core/init.lua
--
local global = require('core.global')
local utils = require('core.utils')
local vim = vim
local g = vim.g

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

local load_plugin_global_vars = function()
  g.move_key_modifier = "S" -- Shift

  g.glow_binary_path = vim.env.HOME .. "/bin"

  g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/vsnip"
  g.tokyonight_style = "night"
  g.tokyonight_italic_functions = true
  g.tokyonight_italic_keywords = true
  g.tokyonight_italic_comments = true
  g.tokyonight_lualine_bold = true
  g.tokyonight_terminal_colors = true
  g.tokyonight_dark_float = true
  g.tokyonight_hide_inactive_statusline = true
  g.tokyonight_sidebars = {"qf", "terminal", "packer"}
  g.tokyonight_transparent = false
  g.tokyonight_transparent_sidebar = false


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

-- Load 'er up
local load_core = function()
  createdir()
  disable_distribution_plugins()
  apply_leader_map()

  require('core.options')

  load_plugin_global_vars()
  require('core.plugins')

  require('core.mappings')

  vim.cmd([[colorscheme tokyonight]])

end

load_core()
