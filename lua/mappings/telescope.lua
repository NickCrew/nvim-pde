local opts = { noremap = true, silent = true }

-- Find Files
Mapper.map(
	"n",
	"<C-e>f",
	":Telescope find_files<CR>",
	opts,
	"Telescope",
	"tele_findfiles",
	"Find Files"
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
	"<leader>b",
	":Telescope buffers<CR>",
	opts,
	"Telescope",
	"tele_leadbuf",
	"Find Buffers"
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

