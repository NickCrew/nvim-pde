local fn = vim.fn


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
    { import = "plugins.editor" },
    { import = "plugins.lang" },
    { import = "plugins.utils" },
    { import = "plugins.ui" },
    { import = "plugins.coding" },
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
    colorscheme = "catppuccin-macchiato"
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
