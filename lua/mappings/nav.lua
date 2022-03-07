-- vim: foldmethod=marker

local opts = { noremap = true, silent = true }

-- Hop {{{
Mapper.map(
	"n",
	"<leader>;",
	":HopWord<CR>",
	opts,
	"Movement",
	"hop_word",
	"Hop To Word"
)

Mapper.map(
	"n",
	"<leader>h",
	":HopWordAC<CR>",
	opts,
	"Movement",
	"hop_wordafter",
	"Hop To Word After Cursor"
)

Mapper.map(
	"n",
	"<leader>H",
	":HopWordBC<CR>",
	opts,
	"Movement",
	"hop_wordbefore",
	"Hop To Word Before Cursor"
)

Mapper.map(
	"n",
	"<leader>L",
	":HopLine<CR>",
	opts,
	"Movement",
	"hop_line",
	"Hop To Line"
)

Mapper.map(
	"n",
	"<leader>l",
	":HopChar1CurrentLine<CR>",
	opts,
	"Movement",
	"hop_char1line",
	"Hop To Character(1) In Current Line"
)

Mapper.map(
	"n",
	"<leader>s",
	":HopChar2AC<CR>",
	opts,
	"Movement",
	"hop_char2_after",
	"Hop To Characters(2) After Cursor"
)

Mapper.map(
	"n",
	"<leader>S",
	":HopChar2BC<CR>",
	opts,
	"Movement",
	"hop_char2_before",
	"Hop To Characters(2) Before Cursor"
)

Mapper.map(
	"n",
	"<leader>w",
	":HopWordCurrentLine<CR>",
	opts,
	"Movement",
	"hop_wordcline",
	"Hop To Word In Current Line"
)

-- }}}

-- Navigator {{{
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

Mapper.map(
	"n",
	"<C-p>",
	"<CMD>lua require('Navigator').previous()<CR>",
	opts,
	"Navigation",
	"nav_prev",
	"Move To Previous Window"
)

--}}}

-- Windows {{{
Mapper.map(
"n",
"<C-e>r",
"<cmd>:resize 10<CR>",
opts,
"Quick Window Resize",
"win_quickresize",
"Resize a window to size 10"
)

Mapper.map(
"n",
"<C-e>q",
"<cmd>lua require('utils').toggle_qf()<CR>",
opts,
"QuickFix",
"qf_toggle2",
"Toggle QuickFix Window"
)
Mapper.map(
"n",
"cq",
"<cmd>lua require('utils').toggle_qf()<CR>",
opts,
"QuickFix",
"qf_toggle",
"Toggle QuickFix Window"
)

Mapper.map(
	"n",
	"<C-e>n",
	":NvimTreeToggle<CR>",
	opts,
	"Project",
	"proj_filetree",
	"Toggle File Tree"
)

Mapper.map(
	"t",
	"<C-[><C-[>",
	"<C-\\><C-n>",
	opts,
	"Terminal",
	"term_quickesc",
	"Quickly Escape Terminal"
)

Mapper.map(
  "n",
  "<M-right>",
  "<C-w>l<C-w>|",
  opts,
  "Windows",
  "win_resizewidthright",
  "Increase Horizontal Width"
)

Mapper.map(
  "n",
  "<M-left>",
  "<C-w>h<C-w>|",
  opts,
  "Windows",
  "win_resizewidthleft",
  "Descrease Horizontal Width"
)

Mapper.map(
	"n",
	"<M-down>",
	"<C-w>j<C-w>_",
	opts,
	"Windows",
	"win_resizesplitmin",
	"Decrease Split Size"
)

Mapper.map(
	"n",
	"<M-up>",
	"<C-w>k<C-w>_",
	opts,
	"Windows",
	"win_resizesplitpos",
	"Increase Split Size"
)

Mapper.map(
	"n",
	"<C-_>",
	"<C-w>_",
	opts,
	"Windows",
	"win_maxwin",
	"Maximize Window"
)

Mapper.map(
	"t",
	"<C-\\>",
	"<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>",
	opts,
	"Terminal",
	"term_togglefloatesc",
	"Toggle Floating Terminal"
)

Mapper.map(
	"n",
	"<C-\\>",
	"<cmd>lua require('FTerm').toggle()<CR>",
	opts,
	"Terminal",
	"term_togglefloat",
	"Toggle Floating Terminal"
)

Mapper.map(
	"n",
	"<leader>bm",
	"<Plug>BookmarksListAll",
	opts,
	"Bookmarks",
	"bm_listall",
	"List all bookmarks"
)

Mapper.map(
	"n",
	"<C-e>a",
	":AerialToggle<CR>",
	opts,
	"LSP",
	"lsp_aerialtogl",
	"Toggle Aerial Sidebar"
)

Mapper.map(
	"n",
	'<leader>"',
	"<cmd>lua require('nvim-peekup').peekup_open()<CR>",
	opts,
	"Yank/Paste",
	"clip_peekup",
	"Open PeekUp"
)
--}}}

-- Buffers {{{

Mapper.map(
	"n",
	"<leader><tab>",
	":b#<CR>",
	opts,
	"Buffers",
	"buf_gotolast",
	"Go To Last Buffer"
)

Mapper.map(
	"n",
	"<A-]>",
	":BufferNext<CR>",
	opts,
	"Buffers",
	"buf_next",
	"Next Buffer"
)

Mapper.map(
	"n",
	"<A-[>",
	":BufferPrevious<CR>",
	opts,
	"Buffers",
	"buf_prev",
	"Previous Buffer"
)
Mapper.map(
"n",
"<leader><leader>db",
":BufferDelete<CR>",
opts,
"Buffers",
"buf_del",
"Delete Buffer"
)
Mapper.map(
"n",
"<C-e>b",
":BufferPick<CR>",
opts,
"Buffers",
"buf_pick",
"Pick Buffer"
)
Mapper.map(
"n",
"<A->>",
":BufferMoveNext<CR>",
opts,
"Buffers",
"buf_movenext",
"Re-order Buffer Next"
)
Mapper.map(
"n",
"<A-<>",
":BufferMovePrevious<CR>",
opts,
"Buffers",
"buf_moveprev",
"Re-order Buffer Previous"
)

-- }}}

-- Harpoon {{{

Mapper.map(
	"n",
	"<A-h>m",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	opts,
	"Navigation",
	"nav_harpoonui",
	"Show Harpoon UI"
)

Mapper.map(
	"n",
	"<A-h>c",
	"<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
	opts,
	"Navigation",
	"nav_harpooncmdui",
	"Show Harpoon Command UI"
)

Mapper.map(
	"n",
	"<A-h>a",
	"<cmd>lua require('harpoon.mark').add_file()<CR>",
	opts,
	"Navigation",
	"nav_harpoonadd",
	"Add File To Harpoon"
)
Mapper.map(
	"n",
	"<A-h>p",
	"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
	opts,
	"Navigation",
	"nav_harpoonprev",
	"Previous Harpoon Target"
)

Mapper.map(
	"n",
	"<A-h>t",
	"<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>",
	opts,
	"Navigation",
	"nav_harpoonterm",
	"Go To Harpoon Terminal"
)

Mapper.map(
	"n",
	"<A-h>n",
	"<cmd>lua require('harpoon.ui').nav_next()<CR>",
	opts,
	"Navigation",
	"nav_harpoonnext",
	"Next Harpoon Target"
)
-- }}}
