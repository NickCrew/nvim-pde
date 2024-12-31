local M = {}

M.ui = {
  colorscheme = {
    light = "tokyonight-day",
    dark = "tokyonight",
    fallback = "tokyonight"
  },
  icons = require("_icons")
}

M.filetypes = {
  { name = "terraform", ext = "*.tf" }
}

M.plugins = {
  devpath = vim.fn.stdpath("config") .. "/lua/devel/plugins",
  devuser = "NickCrew",
  disabled = {
    "2html_plugin",
    "tohtml",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
  }
}

return M
