--------------------------------------------------
-- Description: Load plugins using Lazy
--------------------------------------------------

local devpath = vim.fn.stdpath("config") .. "/lua/devel/plugins"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
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
}, {
  profiling = {
    loader = true,
    require = true,
  },
  checker = {
    enabled = true
  },
  dev = {
    path =  devpath,
    pattern = "NickCrew",
    fallback = false
  },
  install = {
    colorscheme = "tokyonight"
  },
})
