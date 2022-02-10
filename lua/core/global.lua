-- vim:foldmethod=marker
-- lua/core/global.lua
--

local g = vim.g

g.python3_host_prog = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'

-- Plugin Global Variables {{{
g.move_key_modifier = "S" -- Shift
g.glow_binary_path =  os.getenv("HOME").."/bin"
g.cursorhold_updatetime = 100
-- }}}


