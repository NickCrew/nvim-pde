-- vim:foldmethod=marker
-- lua/core/global.lua
--

local g = vim.g

g.python3_host_prog = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'
g.cursorhold_updatetime = 100

-- Plugin Global Variables {{{
--

-- vim-move
g.move_key_modifier = "S" -- Shift

-- Glow
g.glow_binary_path =  os.getenv("HOME").."/bin"

-- peekup
g.peekup_open = '<leader>"'

-- kitty-navigator

--
-- }}}


