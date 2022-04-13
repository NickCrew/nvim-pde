local opts = { noremap = true, silent = true }
-- Go To Last Buffer
Mapper.map(
	"n",
	"<leader><tab>",
	":b#<CR>",
	opts,
	"Buffers",
	"buf_gotolast",
	"Go To Last Buffer"
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

-- Delete to Void Register
Mapper.map(
    "n",
    "<leader>dx",
    '"_dd',
    opts,
    "Copy & Paste",
    "clip_yanktovoid",
    "Delete to Void Register"
)
-- Yank to System Clipboard
Mapper.map(
    "v",
    "<leader>y",
    '"*y',
    opts,
    "Copy & Paste",
    "clip_yanktosys",
    "Yank to System Clipboard"
)
-- Paste from buffer 0
Mapper.map(
    "n",
    "<leader>P",
    "0p",
    opts,
    "Copy & Paste",
    "clip_paste0buf",
    "Paste from buffer 0"
)

-- Turn Off Search Highlights
Mapper.map(
	"n",
	"<leader>,",
	":noh<CR>",
	opts,
	"Search",
	"search_nohighlights",
	"Turn Off Search Highlights"
)


