local opts = { noremap = true, silent = true }

-- Find Files
Mapper.map(
	"n",
	"<C-e><C-b>",
	":Telescope file_browser<CR>",
	opts,
	"Telescope",
	"tele_filebrowser",
	"Find Browser"
)
-- Find Files
Mapper.map(
	"n",
	"<leader>ff",
	":Telescope find_files<CR>",
	opts,
	"Telescope",
	"tele_ff",
	"Find Files"
)
-- Find Buffers
Mapper.map(
	"n",
	"<C-p>",
	":Telescope buffers<CR>",
	opts,
	"Telescope",
	"tele_buf",
	"Find Buffers"
)
-- Live Grep
Mapper.map(
	"n",
	"<leader>g",
	":Telescope live_grep<CR>",
	opts,
	"Telescope",
	"tele_lgrep",
	"Live Grep"
)
-- Command History
Mapper.map(
	"n",
	"<leader>ch",
	":Telescope command_history<CR>",
	opts,
	"Telescope",
	"tele_cmdhist",
	"Command History"
)
-- Diagnostics
Mapper.map(
	"n",
	"<leader><leader>dd",
	":Telescope diagnostics<CR>",
	opts,
	"Telescope",
	"tele_diag",
	"Diagnostics"
)
-- Registers
Mapper.map(
	"n",
	"<leader>r",
	":Telescope registers<CR>",
	opts,
	"Telescope",
	"tele_reg",
	"Registers"
)
-- Marks
Mapper.map(
	"n",
	"<leader>m",
	":Telescope marks<CR>",
	opts,
	"Telescope",
	"tele_marks",
	"Marks"
)
-- Commands
Mapper.map(
	"n",
	"<C-e>c",
	":Telescope commands<CR>",
	opts,
	"Telescope",
	"tele_cmds",
	"Commands"
)
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
