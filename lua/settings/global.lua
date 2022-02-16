local g = vim.g


g.python3_host_prog = os.getenv('HOME')..'/.pyenv/versions/neovim/bin/python'
g.cursorhold_updatetime = 100


local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- nvim-tree
g.nvim_tree_indent_markers = true
-- vim-move
g.move_key_modifier = "S" -- Shift
-- peekup
g.peekup_open = '<leader>"'
-- glow
g.glow_binary_path = os.getenv("HOME") .. "/bin"
-- project.nvim
g.nvim_tree_respect_buf_cwd = true
