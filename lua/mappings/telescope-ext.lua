local opts = { noremap = true, silent = true }
-- Open Task List
Mapper.map(
	"n",
	"<leader>to",
	'<cmd>lua require("telescope").extensions.vstask.tasks()<CR>',
	opts,
	"Tasks",
	"tasks_tasks",
	"Open Task List"
)
-- Close Task List
Mapper.map(
	"n",
	"<leader>tc",
	'<cmd>lua require("telescope").extensions.vstask.close()<CR>',
	opts,
	"Tasks",
	"tasks_close",
	"Close Task List"
)
-- Open Task Input List
Mapper.map(
	"n",
	"<leader>ti",
	'<cmd>lua require("telescope").extensions.vstask.inputs()<CR>',
	opts,
	"Tasks",
	"tasks_inputs",
	"Open Task Input List"
)
-- Refactoring
Mapper.map(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	opts,
	"Telescope",
	"tele_refactor",
	"Refactoring"
)
-- Show Harpoon Marks
Mapper.map(
	"n",
	"<C-e>h",
	":Telescope harpoon marks<CR>",
	opts,
	"Telescope",
	"tele_harpoon",
	"Show Harpoon Marks"
)
-- Live Grep Raw
Mapper.map(
	"n",
	"<leader>lgr",
	':lua require("telescope").extensions.live_grep_raw.live_grep_raw()',
	opts,
	"Telescope",
	"tele_livegrepraw",
	"Live Grep Raw"
)
-- Projects
Mapper.map(
	"n",
	"<leader><leader>p",
	":Telescope projects<CR>",
	opts,
	"Telescope",
	"tele_proj",
	"Projects"
)
-- Debugging Commands
Mapper.map(
	"n",
	"<C-e>d",
	":Telescope dap commands<CR>",
	opts,
	"Telescope",
	"tele_dapcmds",
	"Debugging Commands"
)
-- Mappings
Mapper.map(
	"n",
	"<C-e>k",
	":Telescope keymaps<CR>",
	opts,
	"Telescope",
	"tele_keymaps",
	"Mappings"
)
-- Zoxide
Mapper.map(
	"n",
	"<leader><leader>z",
	":Telescope zoxide list<CR>",
	opts,
	"Telescope",
	"tele_z",
	"Zoxide"
)
-- Search Aerial Symbols
Mapper.map(
	"n",
	"<C-e>A",
	":Telescope aerial<CR>",
	opts,
	"Telescope",
	"tele_aerial",
	"Search Aerial Symbols"
)
-- Open TODOs in QuickFix Window
Mapper.map(
	"n",
	"<leader>td",
	":TodoTelescope<CR>",
	opts,
	"Diagnostics",
	"tele_todo",
	"Open TODOs in QuickFix Window"
)
-- Search Dash for Word Under Cursor
Mapper.map(
	"n",
	"<leader><leader>d",
	":DashWord<CR>",
	opts,
	"Telescope",
	"tele_dashword",
	"Search Dash for Word Under Cursor"
)
