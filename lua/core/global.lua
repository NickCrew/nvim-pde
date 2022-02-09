-- lua/core/global.lua
--

local global = {}
local vim = vim
local os_name = vim.loop.os_uname().sysname
local g = vim.g


function global:load_variables()
  self.is_mac = os_name == "Darwin"
  self.is_linux = os_name == "Linux"
  self.is_iterm = os.getenv('TERM_PROGRAM') == 'iTerm.app'

  self.modules_dir = vim.fn.stdpath("config") .. '/modules'
  self.data_dir = vim.fn.stdpath("data") .. "/site/"
  self.cache_dir = os.getenv("HOME") .. "/.cache/nvim/"

  self.snippets_dir = vim.fn.stdpath("config") .. "/snippets"
  self.halp_dir = vim.fn.stdpath("config") .. "/doc/"
  self.vscode_dir = os.getenv("HOME") .. "/.vscode"

  self.log_path = self.cache_dir .. "/nvim_debug.log"


end

global:load_variables()

return global 
