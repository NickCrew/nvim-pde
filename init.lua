-- vim: set foldmethod=marker foldlevel=0 foldmarker={{{,}}} :
--/////////////////////////////////////////////////
--
-- Neovim Configuration - init.lua
--
--/////////////////////////////////////////////////

local g             = vim.g
local map           = vim.api.nvim_set_keymap
local home          = os.getenv("HOME")
local utils         = require("utils")

-- Global variables
g.PREFS             = require("prefs")
g.nvim_cache        = home .. "/.cache/nvim"
g.python3_host_prog = home .. '/.pyenv/versions/neovim/bin/python'

-- Leader key
vim.keymap.set("", "<space>", "<Nop>") -- Clear any space mappings
g.mapleader      = " "
g.maplocalleader = "\\"

require("autocmds")
require("options")
require("mappings")

--{{{ Plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath, })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
      { import = "plugins.coding" },
      { import = "plugins.lang" },
      { import = "plugins.editor" },
      { import = "plugins.ui" },
      { import = "plugins.devel" },
    }
  },
  {
    profiling = {
      loader = true,
      require = true,
    },
    checker = {
      enabled = true
    },
    dev = {
      path = g.PREFS.plugins.devpath,
      pattern = g.PREFS.plugins.devuser,
      fallback = false
    },
    install = {
      missing = true,
      colorscheme = { g.PREFS.ui.colorscheme },
    },
    performance = {
      rtp = {
        disabled_plugins = g.PREFS.plugins.disabled
      }
    }
  })

--}}}


utils.update_theme()
