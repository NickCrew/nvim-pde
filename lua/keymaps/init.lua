-- Mappings

local vim = vim
local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

function _G.set_terminal_keymaps()
	bufmap(0, "t", "<esc>", [[<C-\><C-n>]], { noremap = true })
	bufmap(0, "t", "jk", [[<C-\><C-n>]], { noremap = true })
	bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true })
	bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true })
	bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true })
	bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true })
end

map("", "<Space>", "<Nop>", { noremap = true, silent = true })
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)
map("n", "<M-left>", "<C-w>h<C-w>|", opts)
map("n", "<M-right>", "<C-w>l<C-w>|", opts)
map("n", "<M-down>", "<C-w>j<C-w>_", opts)
map("n", "<M-up>", "<C-w>k<C-w>_", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)



local wk = require("which-key")
wk.register({require('keymaps.wk.leader')}, {
  prefix = "<leader>"
})
wk.register({require('keymaps.wk.telescope')}, {
  prefix = "<leader><leader>"
})
wk.register({require('keymaps.wk.lsp')}, {
  mode = "n" })
wk.register({require('keymaps.wk.dap')}, {
})
wk.register({require('keymaps.wk.nav')}, {
  prefix = "<C-a>"
})
wk.register({require('keymaps.wk.editor')}, {
  prefix = "<C-e>"
})
wk.register({require('keymaps.wk.refactor')}, {
  mode = "v"
})


