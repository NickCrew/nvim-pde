local opts = { noremap = false, silent = true }

-- Open TODOs in QuickFix Window
Mapper.map(
	"n",
	"<leader>2d",
	":TodoQuickFix<CR>",
	opts,
	"Diagnostics",
	"todo_qf",
	"Open TODOs in QuickFix Window"
)
-- Toggle Underline
Mapper.map(
	"n",
	"<leader>tlu",
	"<Plug>(toggle-lsp-diag-underline)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_ul",
	"Toggle Underline"
)
-- Toggle Signs
Mapper.map(
	"n",
	"<leader>tls",
	"<Plug>(toggle-lsp-diag-signs)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_signs",
	"Toggle Signs"
)
-- Toggle Virtual Text
Mapper.map(
	"n",
	"<leader>tlv",
	"<Plug>(toggle-lsp-diag-vtext)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_vtext",
	"Toggle Virtual Text"
)
-- Toggle Update on Insert
Mapper.map(
	"n",
	"<leader>tlp",
	"<Plug>(toggle-lsp-diag-update_in_insert)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_upins",
	"Toggle Update on Insert"
)
-- Toggle Diagnostics
Mapper.map(
	"n",
	"<leader>tld",
	"<Plug>(toggle-lsp-diag)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl",
	"Toggle Diagnostics"
)
-- Set All To Default
Mapper.map(
	"n",
	"<leader>tldd",
	"<Plug>(toggle-lsp-diag-default)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_default",
	"Set All To Default"
)
-- Turn Off
Mapper.map(
	"n",
	"<leader>tldo",
	"<Plug>(toggle-lsp-diag-off)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_off",
	"Turn Off"
)
-- Turn On
Mapper.map(
	"n",
	"<leader>tldf",
	"<Plug>(toggle-lsp-diag-on)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_on",
	"Turn On"
)
-- Toggle Trouble
Mapper.map(
	"n",
	"<leader>xx",
	"<cmd>TroubleToggle<cr>",
	opts,
	"Diagnostics",
	"trbl_toggle",
	"Toggle Trouble"
)
-- Workspace Diagnostics
Mapper.map(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl__wkspace",
	"Workspace Diagnostics"
)
-- Document Diagnostics
Mapper.map(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl_doc",
	"Document Diagnostics"
)
-- Open Diagnostics in QuickFix
Mapper.map(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<cr>",
	opts,
	"Diagnostics",
	"trbl_qfx",
	"Open Diagnostics in QuickFix"
)
-- Open Diagnostics in Location List
Mapper.map(
	"n",
	"<leader>xl",
	"<cmd>TroubleToggle loclist<cr>",
	opts,
	"Diagnostics",
	"trbl_loc",
	"Open Diagnostics in Location List"
)
-- Diagnostics References
Mapper.map(
	"n",
	"<leader>gR",
	"<cmd>TroubleToggle lsp_references<cr>",
	opts,
	"Diagnostics",
	"trbl_ref",
	"Diagnostics References"
)
-- Open TODOs in QuickFix Window
Mapper.map(
	"n",
	"<leader>2d",
	":TodoQuickFix<CR>",
	opts,
	"Diagnostics",
	"todo_qf",
	"Open TODOs in QuickFix Window"
)
-- Toggle Underline
Mapper.map(
	"n",
	"<leader>tlu",
	"<Plug>(toggle-lsp-diag-underline)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_ul",
	"Toggle Underline"
)
-- Toggle Signs
Mapper.map(
	"n",
	"<leader>tls",
	"<Plug>(toggle-lsp-diag-signs)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_signs",
	"Toggle Signs"
)
-- Toggle Virtual Text
Mapper.map(
	"n",
	"<leader>tlv",
	"<Plug>(toggle-lsp-diag-vtext)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_vtext",
	"Toggle Virtual Text"
)
-- Toggle Update on Insert
Mapper.map(
	"n",
	"<leader>tlp",
	"<Plug>(toggle-lsp-diag-update_in_insert)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_upins",
	"Toggle Update on Insert"
)
-- Toggle Diagnostics
Mapper.map(
	"n",
	"<leader>tld",
	"<Plug>(toggle-lsp-diag)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl",
	"Toggle Diagnostics"
)
-- Set All To Default
Mapper.map(
	"n",
	"<leader>tldd",
	"<Plug>(toggle-lsp-diag-default)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_default",
	"Set All To Default"
)
-- Turn Off
Mapper.map(
	"n",
	"<leader>tldo",
	"<Plug>(toggle-lsp-diag-off)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_off",
	"Turn Off"
)
-- Turn On
Mapper.map(
	"n",
	"<leader>tldf",
	"<Plug>(toggle-lsp-diag-on)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_on",
	"Turn On"
)
-- Toggle Trouble
Mapper.map(
	"n",
	"<leader>xx",
	"<cmd>TroubleToggle<cr>",
	opts,
	"Diagnostics",
	"trbl_toggle",
	"Toggle Trouble"
)
-- Workspace Diagnostics
Mapper.map(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl__wkspace",
	"Workspace Diagnostics"
)
-- Document Diagnostics
Mapper.map(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl_doc",
	"Document Diagnostics"
)
-- Open Diagnostics in QuickFix
Mapper.map(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<cr>",
	opts,
	"Diagnostics",
	"trbl_qfx",
	"Open Diagnostics in QuickFix"
)
-- Open Diagnostics in Location List
Mapper.map(
	"n",
	"<leader>xl",
	"<cmd>TroubleToggle loclist<cr>",
	opts,
	"Diagnostics",
	"trbl_loc",
	"Open Diagnostics in Location List"
)
-- Diagnostics References
Mapper.map(
	"n",
	"<leader>gR",
	"<cmd>TroubleToggle lsp_references<cr>",
	opts,
	"Diagnostics",
	"trbl_ref",
	"Diagnostics References"
)
-- Toggle Twilight
Mapper.map(
	"n",
	"<C-e><C-t>",
	":Twilight<CR>",
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
Mapper.map(
  "n",
  "<leader><leader>w",
  ":WhichKey<CR>",
  opts,
  "Keybindings",
  "keys_showwhichkey",
  "Toggle Legend"
)
Mapper.map(
  "n",
  "<leader>i",
  "<Plug>(IPy-Run)",
  opts,
  "IPython",
  "ipy_run",
  "Run current line or selection in IPython"
)
Mapper.map(
  "n",
  "<leader>ia",
  "<Plug>(IPy-RunAll)",
  opts,
  "IPython",
  "ipy_runall",
  "Run All Lines in Buffer"
)
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
-- Remaps for each of the four debug operations currently offered by the plugin
Mapper.map(
    "v",
    "<Leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_exfunc",
    "Extract Function From Selection"
)
-- Extract Function From Selection
Mapper.map(
    "v",
    "<Leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_exfunctofile",
    "Extract Function To File"
    -- Extract Function From Selection
)
-- Extract Variable From Selection
Mapper.map(
    "v",
    "<Leader>rv",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_exvar",
    "Extract Variable From Selection"
)
-- Inline Variable
Mapper.map(
    "v",
    "<Leader>ri",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false },
    "Refactoring",
    "refac_invar",
    "Inline Variable"
)
-- Open UI
Mapper.map(
	"n",
	"<leader>dui",
	"<cmd>lua require'dapui'.open()<CR>",
	opts,
	"DAP",
	"dap_openui",
	"Open DAP UI"
)
-- Evaluate under cursor
Mapper.map(
	"v",
	"<C-e>k",
	"<cmd>lua require('dapui').eval()<CR>",
	opts,
	"DAP",
	"dap_evalv",
	"Evaluate Selection"
)
-- Evaluate under cursor
Mapper.map(
	"n",
	"<leader>di",
	"<cmd>lua require('dapui').eval()<CR>",
	opts,
	"DAP",
	"dap_inspect",
	"Inspect Word Under Cursor"
)
-- Evaluate under cursor
Mapper.map(
	"n",
	"<C-e>k",
	"<cmd>lua require('dapui').eval()<CR>",
	opts,
	"DAP",
	"dap_eval",
	"Evaluate Word Under Cursor"
)
-- Open REPL
Mapper.map(
	"n",
	"<leader><leader>r",
	":lua require('dap').repl.toggle()<CR>",
	opts,
	"DAP",
	"dap_togglerepl",
	"Toggle REPL"
)
-- Load launch.json
Mapper.map(
	"n",
	"<leader><leader>l",
	"<cmd>lua require('dap.ext.vscode').load_launchjs()<CR>",
	opts,
	"DAP",
	"dap_loadlaunchjs",
	"Load launch.json"
)
-- Toggle breakpoint
Mapper.map(
	"n",
	"<F9>",
	":lua require('dap').toggle_breakpoint()<CR>",
	opts,
	"DAP",
	"dap_breakpt",
	"Toggle Breakpoint"
)
-- Continue
Mapper.map(
	"n",
	"<F5>",
	":lua require('dap').continue()<CR>",
	opts,
	"DAP",
	"dap_cont",
	"Continue"
)
-- Run Last Configuration
Mapper.map(
	"n",
	"<F4>",
	":lua require('dap').run_last()<CR>",
	opts,
	"DAP",
	"dap_runlast",
	"Run Last Configuration"
)
-- Step Over
Mapper.map(
	"n",
	"<F10>",
	":lua require('dap').step_over()<CR>",
	opts,
	"DAP",
	"dap_stepover",
	"Step Over"
)
-- Step Info
Mapper.map(
	"n",
	"<F11>",
	":lua require('dap').step_into()<CR>",
	opts,
	"DAP",
	"dap_stepin",
	"Step Into"
)
-- Step Out
Mapper.map(
	"n",
	"<F12>",
	":lua require('dap').step_out()<CR>",
	opts,
	"DAP",
	"dap_stepout",
	"Step Out"
)
-- Set Conditional Breakpoint
Mapper.map(
	"n",
	"<leader><F9>",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts,
	"DAP",
	"dap_conbreakpt",
	"Condition Breakpoint"
)
-- Set Log Point
Mapper.map(
	"n",
	"<leader><F8>",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts,
	"DAP",
	"dap_fnbreakpt",
	"Function Breakpoint"
)
-- Pause
Mapper.map(
	"n",
	"<F6>",
	":lua require('dap').pause()<CR>",
	opts,
	"DAP",
	"dap_pause",
	"Pause"
)
-- Run To Cursor
Mapper.map(
	"n",
	"<F8>",
	":lua require('dap').run_to_cursor()<CR>",
	opts,
	"DAP",
	"dap_runtocurs",
	"Run to Cursor"
)
-- Toggle Virtual Text
Mapper.map(
	"n",
	"<leader>vt",
	"<cmd>DapVirtualTextToggle<CR>",
	opts,
	"DAP",
	"dap_toggletext",
	"Toggle Virtual Text"
)
-- Refresh virtual text
Mapper.map(
	"n",
	"<leader>rt",
	"<cmd>DapVirtualTextForceRefresh<CR>",
	opts,
	"DAP",
	"dap_textrefresh",
	"Refresh Virtual Text"
)
-- Debug Python Method
Mapper.map(
	"n",
	"<leader><leader>dn",
	"<cmd>lua require('dap-python').test_method()<CR>",
	opts,
	"DAP",
	"dap_pytestmethod",
	"Test Py Method"
)
-- Debug Python Class
Mapper.map(
	"n",
	"<leader><leader>df",
	"<cmd>lua require('dap-python').test_class()<CR>",
	opts,
	"DAP",
	"dap_pytestclass",
	"Test Py Class"
)
-- Debug Python Selection
Mapper.map(
	"v",
	"<leader><leader>ds",
	"<ESC>:lua require('dap-python').debug_selection()<CR>",
	opts,
	"DAP",
	"dap_pydebugsel",
	"Debug Py Selection"
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
	"<leader>a",
	":AerialToggle<CR>",
	opts,
	"LSP",
	"lsp_aerialtogl2",
	"Toggle Aerial Sidebar"
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
-- Toggle QuickFix Window
Mapper.map(
	"n",
	"<leader>qq",
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
	"<leader><leader>f",
	":Fern . -drawer -toggle<CR>",
	opts,
	"Fern",
	"filedrawer_toggle",
	"Toggle File Tree"
)
-- Next Buffer
Mapper.map(
	"n",
	"<M-]>",
	":BufferNext<CR>",
	opts,
	"Buffers",
	"buf_next",
	"Next Buffer"
)
-- Previous Buffer
Mapper.map(
	"n",
	"<M-[>",
	":BufferPrevious<CR>",
	opts,
	"Buffers",
	"buf_prev",
	"Previous Buffer"
)
-- Previous Test Failure
Mapper.map(
	"n",
	"[t",
	"<Plug>(ultest-prev-fail)",
	opts,
	"Tests",
	"tests_prevfail",
	"Previous Test Failure"
)
-- Next Test Failure
Mapper.map(
	"n",
	"]t",
	"<Plug>(ultest-next-fail)",
	opts,
	"Tests",
	"tests_nextfail",
	"Next Test Failure"
)
-- Delete Buffer
Mapper.map(
	"n",
	"<leader><leader>db",
	":BufferDelete<CR>",
	opts,
	"Buffers",
	"buf_del",
	"Delete Buffer"
)
-- Pick Buffer
Mapper.map(
	"n",
	"<leader><leader>b",
	":BufferPick<CR>",
	opts,
	"Buffers",
	"buf_pick",
	"Pick Buffer"
)
-- Re-order Buffer Next
Mapper.map(
	"n",
	"<A->>",
	":BufferMoveNext<CR>",
	opts,
	"Buffers",
	"buf_movenext",
	"Re-order Buffer Next"
)
-- Re-order Buffer Previous
Mapper.map(
	"n",
	"<A-<>",
	":BufferMovePrevious<CR>",
	opts,
	"Buffers",
	"buf_moveprev",
	"Re-order Buffer Previous"
)
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
