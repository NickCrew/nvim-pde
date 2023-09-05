local g = vim.g

--
-- Global
--
g.mapleader             = " "
g.maplocalleader        = "\\"

g.nvim_cache            = os.getenv('HOME') .. "/.cache/nvim"
g.python_bin_dir        = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin'
g.python3_host_prog     = g.python_bin_dir .. '/python'

g.cursorhold_updatetime = 100

local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }


function _G.set_terminal_keymaps()
  bufmap(0, "t", "<esc>", [[<C-\><C-n>]],        opts)
  bufmap(0, "t", "jk",    [[<C-\><C-n>]],        opts)
  bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]],  opts)
  bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]],  opts)
  bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]],  opts)
  bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]],  opts)
end


