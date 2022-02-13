-- vim: foldmethod=marker
--
-- lua/core/mappings.lua
--

Mapper = require("mapstuff")
local opts = { noremap = true, silent = true }

-- LSP {{{

Mapper.map(
	"n",
	"<C-e>v",
	":Vista!!<CR>",
	opts,
	"Symbols",
	"vista_toggle",
	"Toggle Vista"
)

Mapper.map(
  "n",
  "<C-e>A",
  ":Telescope aerial<CR>",
  opts,
  "Telescope",
  "tele_aerial",
  "Search Aerial Symbols"
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
	"gpd",
	"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
	opts,
	"LSP",
	"lsp_gpreviewdef",
	"Preview Definition"
)

Mapper.map(
	"n",
	"gpr",
	"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
	opts,
	"LSP",
	"lsp_gpreviewref",
	"Preview References"
)

Mapper.map(
	"n",
	"gP",
	"<cmd>lua require('goto-preview').close_all_win()<CR>",
	opts,
	"LSP",
	"lsp_gpreviewclose",
	"Close Preview Windows"
)

Mapper.map(
	"n",
	"gpi",
	"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
	opts,
	"LSP",
	"lsp_gpreviewimp",
	"Preview Implementation"
)

-- LSP Diagnostics {{{

Mapper.map(
	"n",
	"<leader><leader>td",
	":ToggleDiag<CR>",
	opts,
	"Diagnostics",
	"diag_toggle",
	"Toggle Diagnostics"
)

Mapper.map(
	"n",
	"<leader>xx",
	"<cmd>TroubleToggle<cr>",
	opts,
	"Diagnostics",
	"trbl_toggle",
	"Toggle Trouble"
)

Mapper.map(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl__wkspace",
	"Workspace Diagnostics"
)

Mapper.map(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl_doc",
	"Document Diagnostics"
)

Mapper.map(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<cr>",
	opts,
	"Diagnostics",
	"trbl_qfx",
	"Open Diagnostics in QuickFix"
)

Mapper.map(
	"n",
	"<leader>xl",
	"<cmd>TroubleToggle loclist<cr>",
	opts,
	"Diagnostics",
	"trbl_loc",
	"Open Diagnostics in Location List"
)

Mapper.map(
	"n",
	"<leader>gR",
	"<cmd>TroubleToggle lsp_references<cr>",
	opts,
	"Diagnostics",
	"trbl_ref",
	"Diagnostics References"
)
-- }}}
-- }}}

-- Windows and Buffer {{{

-- File Drawer {{{
Mapper.map(
	"n",
	"<C-e>n",
	":NvimTreeToggle<CR>",
	opts,
	"Project",
	"proj_filetree",
	"Toggle File Tree"
)
-- }}}

-- Navigating Splits (Windows) {{{



-- }}}

-- {{{ Normal Navigation
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

Mapper.map(
  "t",
  "<C-[><C-[>",
  "<C-\\><C-n>",
  opts,
  "Terminal",
  "term_quickesc",
  "Quickly Escape Terminal"
)
-- }}}

-- Kitty Navigation {{{
Mapper.map(
  "n",
  "<C-k>j",
  ":KittyNavigateDown<CR>",
  opts,
  "Navigation",
  "nav_kittydown",
  "Navigate To Window Below"
)
Mapper.map(
  "n",
  "<C-k>k",
  ":KittyNavigateUp<CR>",
  opts,
  "Navigation",
  "nav_kittyup",
  "Navigate To Window Above"
)
Mapper.map(
  "n",
  "<C-k>l",
  ":KittyNavigateRight<CR>",
  opts,
  "Navigation",
  "nav_kittyright",
  "Navigate To Right Window"
)
Mapper.map(
  "n",
  "<C-k>h",
  ":KittyNavigateLeft<CR>",
  opts,
  "Navigation",
  "nav_kittyleft",
  "Navigate To Left Window"
)
-- }}}

-- }}}

-- Manipulating Windows and Buffers {{{
Mapper.map(
	"n",
	"<A-down>",
	":lua require('core.utils').resize_split('minus')<CR>",
	opts,
	"Navigation",
	"nav_resizesplitmin",
	"Decrease Split Size"
)

Mapper.map(
	"n",
	"<A-up>",
	":lua require('core.utils').resize_split('plus')<CR>",
	opts,
	"Navigation",
	"nav_resizesplitpos",
	"Increase Split Size"
)

Mapper.map(
	"n",
	"Q",
	":cclose<CR>",
	opts,
	"QuickFix",
	"qfx_close",
	"Close QuickFix Window"
)

Mapper.map(
	"n",
	"<C-_>",
	"<C-w>_",
	opts,
	"Navigation",
	"nav_maxwin",
	"Maximize Window"
)

Mapper.map(
	"n",
	"<C-e>f",
	":FloatermToggle<CR>",
	opts,
	"Terminal",
	"term_floattoggl",
	"Toggle Floating Terminal"
)
-- }}}

-- {{{ Navigating Buffers

Mapper.map(
	"n",
	"<C-e>t",
	":split term://zsh<CR>",
	opts,
	"Terminal",
	"term_newsplit",
	"New Terminal In Split Window"
)

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
	":BufferLineCycleNext<CR>",
	opts,
	"Buffers",
	"buf_next",
	"Next Buffer"
)

Mapper.map(
	"n",
	"<A-[>",
	":BufferLineCyclePrev<CR>",
	opts,
	"Buffers",
	"buf_prev",
	"Previous Buffer"
)
-- }}}

-- }}}

-- Copy/Paste {{{
Mapper.map(
	"n",
	"<leader>dx",
	'"_dd',
	opts,
	"Copy & Paste",
	"clip_yanktovoid",
	"Delete to Void Register"
)

Mapper.map(
	"v",
	"<leader>y",
	'"*y',
	opts,
	"Copy & Paste",
	"clip_yanktosys",
	"Yank to System Clipboard"
)

Mapper.map(
	"n",
	"<leader>P",
	"0p",
	opts,
	"Copy & Paste",
	"clip_paste0buf",
	"Paste from buffer 0"
)
-- }}}

-- Telescope {{{

-- Native {{{
Mapper.map(
	"n",
	"<leader>ff",
	":Telescope find_files<CR>",
	opts,
	"Telescope",
	"tele_ff",
	"Find Files"
)

Mapper.map(
	"n",
	"<leader>bb",
	":Telescope buffers<CR>",
	opts,
	"Telescope",
	"tele_buf",
	"Find Buffers"
)

Mapper.map(
	"n",
	"<leader>g",
	":Telescope live_grep<CR>",
	opts,
	"Telescope",
	"tele_lgrep",
	"Live Grep"
)

Mapper.map(
	"n",
	"<leader>ch",
	":Telescope command_history<CR>",
	opts,
	"Telescope",
	"tele_cmdhist",
	"Command History"
)

Mapper.map(
	"n",
	"<leader>r",
	":Telescope registers<CR>",
	opts,
	"Telescope",
	"tele_reg",
	"Registers"
)

Mapper.map(
	"n",
	"<leader>m",
	":Telescope marks<CR>",
	opts,
	"Telescope",
	"tele_marks",
	"Marks"
)

Mapper.map(
	"n",
	"<C-e>c",
	":Telescope commands<CR>",
	opts,
	"Telescope",
	"tele_cmds",
	"Commands"
)
-- }}}

-- Extensions {{{
Mapper.map(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	opts,
	"Telescope",
	"tele_refactor",
	"Refactoring"
)

Mapper.map(
	"n",
	"<C-e>h",
	":Telescope harpoon marks<CR>",
	opts,
	"Telescope",
	"tele_harpoon",
	"Show Harpoon Marks"
)

Mapper.map(
	"n",
	"<leader>lgr",
	':lua require("telescope").extensions.live_grep_raw.live_grep_raw()',
	opts,
	"Telescope",
	"tele_livegrepraw",
	"Live Grep Raw"
)

Mapper.map(
	"n",
	"<C-e>p",
	":Telescope projects<CR>",
	opts,
	"Telescope",
	"tele_proj",
	"Projects"
)

Mapper.map(
	"n",
	"<C-e>d",
	":Telescope dap commands<CR>",
	opts,
	"Telescope",
	"tele_dapcmds",
	"Debugging Commands"
)

Mapper.map(
	"n",
	"<C-e>k",
	":Telescope keymaps<CR>",
	opts,
	"Telescope",
	"tele_keymaps",
	"Mappings"
)

Mapper.map(
	"n",
	"<leader><leader>z",
	":Telescope zoxide list<CR>",
	opts,
	"Telescope",
	"tele_z",
	"Zoxide"
)
-- }}}

-- }}}

-- Debugging (nvim-dap) {{{
Mapper.map(
	"n",
	"<F9>",
	":lua require('dap').toggle_breakpoint()<CR>",
	opts,
	"Debugging",
	"dap_breakpt",
	"Toggle Breakpoint"
)

Mapper.map(
	"n",
	"<leader>rp",
	":lua require('dap').repl.open()<CR>",
	opts,
	"Debugging",
	"dap_oprepl",
	"Open REPL"
)

Mapper.map(
	"n",
	"<F5>",
	":lua require('dap').continue()<CR>",
	opts,
	"Debugging",
	"dap_cont",
	"Continue"
)

Mapper.map(
	"n",
	"<F10>",
	":lua require('dap').step_over()<CR>",
	opts,
	"Debugging",
	"dap_stepover",
	"Step Over"
)

Mapper.map(
	"n",
	"<F11>",
	":lua require('dap').step_in()<CR>",
	opts,
	"Debugging",
	"dap_stepin",
	"Step Into"
)

Mapper.map(
	"n",
	"<F12>",
	":lua require('dap').step_out()<CR>",
	opts,
	"Debugging",
	"dap_stepout",
	"Step Out"
)

Mapper.map(
	"n",
	"<leader><F9>",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts,
	"Debugging",
	"dap_conbreakpt",
	"Condition Breakpoint"
)

Mapper.map(
	"n",
	"<F8>",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts,
	"Debugging",
	"dap_fnbreakpt",
	"Function Breakpoint"
)

Mapper.map(
	"n",
	"<F6>",
	":lua require('dap').pause()<CR>",
	opts,
	"Debugging",
	"dap_pause",
	"Pause"
)

Mapper.map(
	"n",
	"<leader><F8>",
	":lua require('dap').run_to_cursor()<CR>",
	opts,
	"Debugging",
	"dap_runtocurs",
	"Run to Cursor"
)
-- }}}

-- Moving Around {{{

-- Motions (hop) {{{
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

-- Search (hslens) {{{
Mapper.map(
	"n",
	"<leader>,",
	":noh<CR>",
	opts,
	"Search",
	"search_nohilites",
	"Remove Search Highlights"
)

Mapper.map(
	"n",
	"#",
	"<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>",
	opts,
	"Search",
	"search_undercursback",
	"Search Backwards Under Cursor"
)

Mapper.map(
	"n",
	"*",
	"<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>",
	opts,
	"Search",
	"search_undercurs",
	"Search Forward Under Cursor"
)

Mapper.map(
	"n",
	"N",
	"<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>",
	opts,
	"Search",
	"search_back",
	"Next Backwards Match"
)

Mapper.map(
	"n",
	"n",
	"<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>",
	opts,
	"Search",
	"search_fwd",
	"Next Forward Match"
)
-- }}}

-- }}}

-- {{{ Intellicode (Treesitter)

-- Refactoring {{{
-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
Mapper.map(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>",
    opts,
    "Refactoring",
    "refac_debugprint",
    "Debug Print"
)

-- Print var: this remap should be made in visual mode
Mapper.map(
	"v",
	"<leader>rv",
	":lua require('refactoring').debug.print_var({})<CR>",
    opts,
    "Refactoring",
    "refac_printvar",
    "Debug Print Variable"
)

-- Cleanup function: this remap should be made in normal mode
Mapper.map(
	"n",
	"<leader>rc",
	":lua require('refactoring').debug.cleanup({})<CR>",
    opts,
	"Refactoring",
	"refac_cleanup",
	"Cleanup"
)

Mapper.map(
	"v",
	"<Leader>re",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false },
	"Refactoring",
	"refac_exfunc",
	"Extract Function From Selection"
) -- Remaps for each of the four debug operations currently offered by the plugin

Mapper.map(
	"v",
	"<Leader>rf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false },
	"Refactoring",
	"refac_exfunctofile",
	"Extract Function To File"
)

Mapper.map(
	"v",
	"<Leader>rv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false },
	"Refactoring",
	"refac_exvar",
	"Extract Variable From Selection"
)

Mapper.map(
	"v",
	"<Leader>ri",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false },
	"Refactoring",
	"refac_invar",
	"Inline Variable"
)
-- }}}

-- }}}

-- Task Runner (launch.json) {{{
Mapper.map(
	"n",
	"<leader>to",
	'<cmd>lua require("telescope").extensions.vstask.tasks()<CR>',
	opts,
	"Tasks",
	"tasks_tasks",
	"Open Task List"
)

Mapper.map(
	"n",
	"<leader>tc",
	'<cmd>lua require("telescope").extensions.vstask.close()<CR>',
	opts,
	"Tasks",
	"tasks_close",
	"Close Task List"
)

Mapper.map(
	"n",
	"<leader>ti",
	'<cmd>lua require("telescope").extensions.vstask.inputs()<CR>',
	opts,
	"Tasks",
	"tasks_inputs",
	"Open Task Input List"
)
-- }}}

-- File Management {{{
Mapper.map(
	"n",
	"<C-e>n",
	":NvimTreeToggle<CR>",
	opts,
	"Project",
	"proj_filetree",
	"Toggle File Tree"
)
--- }}}

-- (Book)Marks {{{

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

-- Marks {{{
Mapper.map(
	"n",
	"<leader>bm",
	"<Plug>BookmarksListAll",
	opts,
	"Bookmarks",
	"bm_listall",
	"List all bookmarks"
)
-- }}}

-- }}}

-- Git {{{
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
-- }}}

-- Misc. Plugins {{{
Mapper.map(
	"n",
	"<C-e>C",
	":Cheatsheet<CR>",
	opts,
	"Cheatsheets",
	"cheat_open",
	"Open Cheatsheet"
)
-- }}}
