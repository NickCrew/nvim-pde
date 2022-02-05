-- lua/core/init.lua
--
local global = require("core.global")
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
  vim.g.loaded_gzip = false
  vim.g.loaded_tar = false
  vim.g.loaded_tarPlugin = false
  vim.g.loaded_zip = false
  vim.g.loaded_zipPlugin = false
  vim.g.loaded_getscript = false
  vim.g.loaded_getscriptPlugin = false
  vim.g.loaded_vimball = false
  vim.g.loaded_vimballPlugin = false
  vim.g.loaded_matchit = false
  vim.g.loaded_matchparen = false
  vim.g.loaded_2html_plugin = false
  vim.g.loaded_logiPat = false
  vim.g.loaded_rrhelper = false
  vim.g.loaded_netrw = true
  vim.g.loaded_netrwPlugin = true
  vim.g.loaded_netrwSettings = true
  vim.g.loaded_netrwFileHandlers = true
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

  require("core.options")
  require("plugins")
  require('core.mappings')

  vim.cmd[[colorscheme gruvbox]]
 -- vim.cmd([[highlight Normal guibg=none]])
 -- vim.cmd([[highlight NonText ctermbg=none]])
end

load_core()
