local opts = { noremap = true, silent = true }

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
-- Toggle Mundo
Mapper.map(
	"n",
	"<C-e>u",
	":MundoToggle<CR>",
	opts,
	"Sidebars",
	"undo_mundotoggl",
	"Toggle Mundo"
)
-- Open Spectre
Mapper.map(
	"n",
	"<C-e>S",
	"<cmd>lua require('spectre').open()<CR>",
	opts,
	"Spectre",
	"search_openspectre",
	"Open Spectre"
)
-- Current Word Search
Mapper.map(
	"n",
	"<leader><leader>sw",
	"<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
	opts,
	"Spectre",
	"search_openspectrevissel",
	"Current Word Search"
)
Mapper.map(
	"n",
	"<C-e>s",
	"<cmd>lua require('spectre').open_visual()<CR>",
	opts,
	"Spectre",
	"search_openspectrevis",
	"Current Word Search"
)
-- File Search
Mapper.map(
	"n",
	"<leader><leader>sp",
	"viw:lua require('spectre').open_file_search()<cr>",
	opts,
	"Spectre",
	"search_openfilespectre",
	"File Search"
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
-- Load Persistence
Mapper.map(
	"n",
	"<leader>qs",
	[[<cmd>lua require("persistence").load()<cr>]],
	opts,
	"Session",
	"sesh_loadpersist",
	"Load Persistence"
)
-- restore the last session
Mapper.map(
	"n",
	"<leader>ql",
	[[<cmd>lua require("persistence").load({ last = true })<cr>]],
	opts,
	"Session",
	"sesh_loadlastpersist",
	"Load Last Persistence Session"
)
-- stop Persistence => session won't be saved on exit
Mapper.map(
	"n",
	"<leader>qd",
	[[<cmd>lua require("persistence").stop()<cr>]],
	opts,
	"Session",
	"sesh_stoppersist",
	"Stop Persistence"
)
-- Toggle Twilight
Mapper.map(
	"n",
	"<C-e><C-t>",
	":Twilight",
	opts,
	"UI",
	"ui_twilighttoggl",
	"Toggle Twilight"
)
-- Show Git Messages
Mapper.map(
	"n",
	"<leader>Gm",
	"<Plug>(git-messenger",
	{ noremap = false, silent = false },
	"Git",
	"git_messenger",
	"Show Git Messages"
)
-- Toggle Git Blame
Mapper.map(
	"n",
	"<leader>gb",
	":Gitsigns toggle_current_line_blame<CR>",
	opts,
	"Git",
	"git_toggle_blame",
	"Toggle Git Blame"
)
-- Toggle Git Blame
Mapper.map(
	"n",
	"<leader>gb",
	":Gitsigns toggle_current_line_blame<CR>",
	opts,
	"Git",
	"git_toggle_blame",
	"Toggle Git Blame"
)
-- Open Cheatsheet
Mapper.map(
	"n",
	"<C-e>C",
	":Cheatsheet<CR>",
	opts,
	"Cheatsheets",
	"cheat_open",
	"Open Cheatsheet"
)
-- Run Tests
Mapper.map(
	"n",
	"<leader><leader>t",
	":Ultest<CR>",
	opts,
	"Tests",
	"ultest_run",
	"Run Tests"
)
