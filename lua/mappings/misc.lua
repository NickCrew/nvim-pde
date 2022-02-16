local opts = { noremap = true, silent = true }
-- restore the session for the current directory
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

Mapper.map(
	"n",
	"<C-e><C-t>",
	":Twilight",
	opts,
	"UI",
	"ui_twilighttoggl",
	"Toggle Twilight"
)

Mapper.map(
	"n",
	"<leader>Gm",
	"<Plug>(git-messenger",
	{ noremap = false, silent = false },
	"Git",
	"git_messenger",
	"Show Git Messages"
)
Mapper.map(
	"n",
	"<leader>gb",
	":Gitsigns toggle_current_line_blame<CR>",
	opts,
	"Git",
	"git_toggle_blame",
	"Toggle Git Blame"
)

Mapper.map(
	"n",
	"<C-e>C",
	":Cheatsheet<CR>",
	opts,
	"Cheatsheets",
	"cheat_open",
	"Open Cheatsheet"
)

Mapper.map(
	"n",
	"<leader>Dt",
	"<cmd>lua require('dark_notify').toggle()<CR>",
	opts,
	"Style",
	"style_toggle",
	"Toggle Style"
)

Mapper.map(
	"n",
	"<leader>Ds",
	"<cmd>lua require('dark_notify').stop()<CR>",
	opts,
	"Style",
	"style_stop",
	"Stop Reacting To System Style"
)

Mapper.map(
	"n",
	"<leader>Du",
	"<cmd>lua require('dark_notify').update()<CR>",
	opts,
	"Style",
	"style_update",
	"Match System Style"
)

Mapper.map(
	"n",
	"<leader>Dr",
	"<cmd>lua require('dark_notify').run()<CR>",
	opts,
	"Style",
	"style_run",
	"Start Reacting To System Style"
)
