local opts = { noremap = true, silent = true }
-- Hop To Word
Mapper.map(
	"n",
	"<leader>;",
	":HopWord<CR>",
	opts,
	"Movement",
	"hop_word",
	"Hop To Word"
)
-- Hop To Word After Cursor
Mapper.map(
	"n",
	"<leader>h",
	":HopWordAC<CR>",
	opts,
	"Movement",
	"hop_wordafter",
	"Hop To Word After Cursor"
)
-- Hop To Word Before Cursor
Mapper.map(
	"n",
	"<leader>H",
	":HopWordBC<CR>",
	opts,
	"Movement",
	"hop_wordbefore",
	"Hop To Word Before Cursor"
)
-- Hop To Line
Mapper.map(
	"n",
	"<leader>L",
	":HopLine<CR>",
	opts,
	"Movement",
	"hop_line",
	"Hop To Line"
)
-- Hop To Character(1) In Current Line
Mapper.map(
	"n",
	"<leader>l",
	":HopChar1CurrentLine<CR>",
	opts,
	"Movement",
	"hop_char1line",
	"Hop To Character(1) In Current Line"
)
-- Hop To Characters(2) After Cursor
Mapper.map(
	"n",
	"<leader>s",
	":HopChar2AC<CR>",
	opts,
	"Movement",
	"hop_char2_after",
	"Hop To Characters(2) After Cursor"
)
-- Hop To Characters(2) Before Cursor
Mapper.map(
	"n",
	"<leader>S",
	":HopChar2BC<CR>",
	opts,
	"Movement",
	"hop_char2_before",
	"Hop To Characters(2) Before Cursor"
)
-- Hop To Word In Current Line
Mapper.map(
	"n",
	"<leader>w",
	":HopWordCurrentLine<CR>",
	opts,
	"Movement",
	"hop_wordcline",
	"Hop To Word In Current Line"
)
-- Show Harpoon UI
Mapper.map(
	"n",
	"<A-h>m",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	opts,
	"Navigation",
	"nav_harpoonui",
	"Show Harpoon UI"
)
-- Show Harpoon Command UI
Mapper.map(
	"n",
	"<A-h>c",
	"<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
	opts,
	"Navigation",
	"nav_harpooncmdui",
	"Show Harpoon Command UI"
)
-- Add File To Harpoon
Mapper.map(
	"n",
	"<A-h>a",
	"<cmd>lua require('harpoon.mark').add_file()<CR>",
	opts,
	"Navigation",
	"nav_harpoonadd",
	"Add File To Harpoon"
)
-- Previous Harpoon Target
Mapper.map(
	"n",
	"<A-h>p",
	"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
	opts,
	"Navigation",
	"nav_harpoonprev",
	"Previous Harpoon Target"
)
-- Go To Harpoon Terminal
Mapper.map(
	"n",
	"<A-h>t",
	"<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>",
	opts,
	"Navigation",
	"nav_harpoonterm",
	"Go To Harpoon Terminal"
)
-- Next Harpoon Target
Mapper.map(
	"n",
	"<A-h>n",
	"<cmd>lua require('harpoon.ui').nav_next()<CR>",
	opts,
	"Navigation",
	"nav_harpoonnext",
	"Next Harpoon Target"
)
-- List all bookmarks
Mapper.map(
	"n",
	"<leader>bm",
	"<Plug>BookmarksListAll",
	opts,
	"Bookmarks",
	"bm_listall",
	"List all bookmarks"
)
