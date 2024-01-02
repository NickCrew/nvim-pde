--------------------------------------------------
-- Description: Load plugins using Lazy
--------------------------------------------------

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
  }
}, {
  profiling = {
    loader = true,
    require = true,
  },
  checker = {
    enabled = true
  },
  install = {
    colorscheme = "carbonfox"
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "spellfile",
        "matchit",
        "matchparen",
      },
    },
  },
})
