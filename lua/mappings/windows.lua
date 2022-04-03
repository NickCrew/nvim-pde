local opts = { noremap = true, silent = true }


-- Move To Window Left
Mapper.map(
	"n",
	"<C-h>",
	-- "<C-w><C-h>",
	"<CMD>lua require('Navigator').left()<CR>",
	opts,
	"Navigation",
	"nav_left",
	"Move To Window Left"
)
-- Move To Window Above
Mapper.map(
	"n",
	"<C-k>",
	-- "<C-w><C-k>",
	"<CMD>lua require('Navigator').up()<CR>",
	opts,
	"Navigation",
	"nav_up",
	"Move To Window Above"
)
-- Move To Window Right
Mapper.map(
	"n",
	"<C-l>",
	-- "<C-w><C-l>",
	"<CMD>lua require('Navigator').right()<CR>",
	opts,
	"Navigation",
	"nav_right",
	"Move To Window Right"
)
-- Move To Window Below
Mapper.map(
	"n",
	"<C-j>",
	-- "<C-w><C-j>"
	"<CMD>lua require('Navigator').down()<CR>",
	opts,
	"Navigation",
	"nav_down",
	"Move To Window Below"
)
-- Move To Previous Window
Mapper.map(
	"n",
	"<C-p>",
	"<CMD>lua require('Navigator').previous()<CR>",
	opts,
	"Navigation",
	"nav_prev",
	"Move To Previous Window"
)
-- Resize a window to size 10
Mapper.map(
	"n",
	"<C-e>r",
	"<cmd>:resize 10<CR>",
	opts,
	"Quick Window Resize",
	"win_quickresize",
	"Resize a window to size 10"
)
-- Toggle QuickFix Window
Mapper.map(
	"n",
	"<C-e>q",
	"<cmd>lua require('utils').toggle_qf()<CR>",
	opts,
	"QuickFix",
	"qf_toggle2",
	"Toggle QuickFix Window"
)
-- Toggle QuickFix Window
Mapper.map(
	"n",
	"cq",
	"<cmd>lua require('utils').toggle_qf()<CR>",
	opts,
	"QuickFix",
	"qf_toggle",
	"Toggle QuickFix Window"
)
-- Toggle File Tree
Mapper.map(
	"n",
	"<C-e>\\",
	":NeoTreeFloatToggle<CR>",
	opts,
	"Project",
	"filedrawer_reveal",
	"Toggle File Tree"
)
-- Toggle File Tree
Mapper.map(
	"n",
	"<C-e>n",
	":NeoTreeShowToggle<CR>",
	opts,
	"Project",
	"toggl_drawer_files",
	"Toggle File Tree"
)
-- Toggle Git Status Float
Mapper.map(
	"n",
	"<C-e>g",
	":Neotree float git_status<CR>",
	opts,
	"Project",
	"toggle_float_gitstatus",
	"Toggle Buffer Tree"
)
-- Toggle Buffer Tree
Mapper.map(
	"n",
	"<C-e>b",
	":Neotree buffers<CR>",
	opts,
	"Project",
	"toggle_drawer_buffers",
	"Toggle Buffer Tree"
)
-- Quickly Escape Terminal
Mapper.map(
	"t",
	"<Esc><Esc>",
	"<C-\\><C-n>",
	opts,
	"Terminal",
	"term_quickesc",
	"Quickly Escape Terminal"
)
-- Increase Horizontal Width
Mapper.map(
	"n",
	"<M-right>",
	"<C-w>l<C-w>|",
	opts,
	"Windows",
	"win_resizewidthright",
	"Increase Horizontal Width"
)
-- Descrease Horizontal Width
Mapper.map(
	"n",
	"<M-left>",
	"<C-w>h<C-w>|",
	opts,
	"Windows",
	"win_resizewidthleft",
	"Descrease Horizontal Width"
)
-- Decrease Split Size
Mapper.map(
	"n",
	"<M-down>",
	"<C-w>j<C-w>_",
	opts,
	"Windows",
	"win_resizesplitmin",
	"Decrease Split Size"
)
-- Increase Split Size
Mapper.map(
	"n",
	"<M-up>",
	"<C-w>k<C-w>_",
	opts,
	"Windows",
	"win_resizesplitpos",
	"Increase Split Size"
)
-- Maximize Window
Mapper.map(
	"n",
	"<C-_>",
	"<C-w>_",
	opts,
	"Windows",
	"win_maxwin",
	"Maximize Window"
)
-- Toggle Floating Terminal
Mapper.map(
	"t",
	"<C-\\>",
	"<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>",
	opts,
	"Terminal",
	"term_togglefloatesc",
	"Toggle Floating Terminal"
)
-- Toggle Floating Terminal
Mapper.map(
	"n",
	"<C-\\>",
	"<cmd>lua require('FTerm').toggle()<CR>",
	opts,
	"Terminal",
	"term_togglefloat",
	"Toggle Floating Terminal"
)
-- Toggle Aerial Sidebar
Mapper.map(
	"n",
	"<C-e>a",
	":AerialToggle<CR>",
	opts,
	"LSP",
	"lsp_aerialtogl",
	"Toggle Aerial Sidebar"
)
-- Open PeekUp
Mapper.map(
	"n",
	'<leader>"',
	"<cmd>lua require('nvim-peekup').peekup_open()<CR>",
	opts,
	"Yank/Paste",
	"clip_peekup",
	"Open PeekUp"
)


