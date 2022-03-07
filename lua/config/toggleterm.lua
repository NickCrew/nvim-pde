-- lua/configure/toggleterm.lua
--

local vim = vim
require('toggleterm').setup {
  size = 10,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 3,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "shadow",
    width = 100,
    height = 20,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local Terminal = require("toggleterm.terminal").Terminal

-- Docker
local lazydocker = Terminal:new { cmd = "lazydocker", hidden = true }
function _LAZY_DOCKER()
  lazydocker:toggle()
end
vim.cmd([[command! -count=1 TermGit lua require'toggleterm'.exec('lazygit', <count>, 12)]])
vim.cmd([[cnoreabbrev TTG TermGit]])

-- Git
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.cmd([[command! -count=1 TermDocker lua require'toggleterm'.exec('lazydocker', <count>, 12)]])
vim.cmd([[cnoreabbrev TTD TermDocker]])

-- Node
local node = Terminal:new { cmd = "node", hidden = true }
function _NODE_TOGGLE()
  node:toggle()
end
vim.cmd([[command! -count=1 TermNode lua require'toggleterm'.exec('node', <count>, 12)]])
vim.cmd([[cnoreabbrev TTN TerNode]])

-- Python
local python = Terminal:new { cmd = "python", hidden = true }
function _PYTHON_TOGGLE()
  python:toggle()
end
vim.cmd([[command! -count=1 TermPython lua require'toggleterm'.exec('python', <count>, 12)]])
vim.cmd([[cnoreabbrev TTPY TermPython]])

-- IPython
local ipython = Terminal:new { cmd = "ipython", hidden = true }
function _IPYTHON_TOGGLE()
  ipython:toggle()
end
vim.cmd([[command! -count=1 TermIPython lua require'toggleterm'.exec('ipython', <count>, 12)]])
vim.cmd([[cnoreabbrev TTIP TermIPython]])


