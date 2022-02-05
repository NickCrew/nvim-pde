-- lua/keymap/init.lua
--
-- We define mappings here in one place just because it makes
-- them easier to keep track of

Mapper = require("mapstuff")
local opts = { noremap = true, silent = true }

Mapper.map(
'n',
'gpd',
"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
opts,
'LSP',
'lsp_gpreviewdef',
'Preview Definition'
)
Mapper.map(
'n',
'gpr',
"<cmd>lua require('goto-preview').goto_preview_references()<CR>",
opts,
'LSP',
'lsp_gpreviewref',
'Preview References'
)
Mapper.map(
'n',
'gP',
"<cmd>lua require('goto-preview').close_all_win()<CR>",
opts,
'LSP',
'lsp_gpreviewclose',
'Close Preview Windows'
)
Mapper.map(
'n',
'gpi',
"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
opts,
'LSP',
'lsp_gpreviewimp',
'Preview Implementation'
)

Mapper.map(
'n',
'<C-e>a',
':CodeActionMenu<CR>',
opts,
'LSP',
'lsp_actionmenu',
'Show Code Action Menu'
)

Mapper.map(
'n',
'<C-e>b',
":lua require('nvim-lightbulb').update_lightbulb()<CR>",
opts,
'LSP',
'lsp_bulb',
'Show Lightbulb'
)

Mapper.map(
'n',
'<C-e>n',
':NvimTreeToggle<CR>',
opts,
'Project',
'proj_filetree',
'Toggle File Tree'
)

Mapper.map(
"n",
"<C-h>",
"<CMD>lua require('Navigator').left()<CR>",
opts,
'Navigation',
'nav_left',
"Move To Window Left"
)
Mapper.map(
"n",
"<C-k>",
"<CMD>lua require('Navigator').up()<CR>",
opts,
'Navigation',
'nav_up',
'Move To Window Above'
)
Mapper.map(
"n",
"<C-l>", 
"<CMD>lua require('Navigator').right()<CR>",
opts,
'Navigation',
'nav_right',
'Move To Window Right'
)
Mapper.map(
"n",
"<C-j>",
"<CMD>lua require('Navigator').down()<CR>",
opts,
'Navigation',
'nav_down',
'Move To Window Below'
)
Mapper.map(
"n",
"<C-p>",
"<CMD>lua require('Navigator').previous()<CR>",
opts,
'Navigation',
'nav_prev',
'Move To Previous Window'
)

Mapper.map(
  "n",
  "<leader><leader><down>",
  ":lua require('core.utils').resize_split('minus')<CR>",
  { noremap = true, silent = true },
  "Navigation",
  "nav_resizesplitmin",
  "Decrease Split Size"
)
Mapper.map(
  "n",
  "<leader><leader><up>",
  ":lua require('core.utils').resize_split('plus')<CR>",
  { noremap = true, silent = true },
  "Navigation",
  "nav_resizesplitpos",
  "Increase Split Size"
)

Mapper.map(
  "n",
  "#",
  "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>",
  { noremap = true, silent = true },
  "Search",
  "search_undercursback",
  "Search Backwards Under Cursor"
)

Mapper.map(
  "n",
  "*",
  "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>",
  { noremap = true, silent = true },
  "Search",
  "search_undercurs",
  "Search Forward Under Cursor"
)
Mapper.map(
  "n",
  "N",
  "<Cmd>execute('normal! ' . v:count1 . 'Nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>",
  { noremap = true, silent = true },
  "Search",
  "search_back",
  "Next Backwards Match"
)

Mapper.map(
  "n",
  "n",
  "<Cmd>execute('normal! ' . v:count1 . 'nzzzv')<CR><Cmd>lua require('hlslens').start()<CR>",
  { noremap = true, silent = true },
  "Search",
  "search_fwd",
  "Next Forward Match"
)
Mapper.map("n", "Q", ":cclose<CR>", { noremap = true, silent = true }, "QuickFix", "qfx_close", "Close QuickFix Window")

Mapper.map(
  "n",
  "<C-e>t",
  ":split term://zsh<CR>",
  { noremap = true, silent = true },
  "Terminal",
  "term_newsplit",
  "New Terminal In Split Window"
)

Mapper.map(
  "n",
  "<leader>l",
  ":noh<CR>",
  { noremap = true, silent = true },
  "Search",
  "search_nohilites",
  "Remove Search Highlights"
)

Mapper.map(
  "n",
  "<leader><tab>",
  ":b#<CR>",
  { noremap = true, silent = true },
  "Buffers",
  "buf_gotolast",
  "Go To Last Buffer"
)

Mapper.map("n", "<C-_>", "<C-w>_", { noremap = true, silent = true }, "Navigation", "nav_maxwin", "Maximize Window")

Mapper.map(
  "n",
  "<leader>dx",
  '"_dd',
  { noremap = true, silent = true },
  "Copy & Paste",
  "clip_yanktovoid",
  "Delete to Void Register"
)

Mapper.map(
  "v",
  "<leader>y",
  '"*y',
  { noremap = true, silent = true },
  "Copy & Paste",
  "clip_yanktosys",
  "Yank to System Clipboard"
)

Mapper.map(
  "n",
  "<leader>P",
  "0p",
  { noremap = true, silent = true },
  "Copy & Paste",
  "clip_paste0buf",
  "Paste from buffer 0"
)
Mapper.map(
  "n",
  "<C-e>C",
  ":Cheatsheet<CR>",
  { noremap = true, silent = true },
  "Cheatsheets",
  "cheat_open",
  "Open Cheatsheet"
)
Mapper.map(
  "n",
  "<leader>ff",
  ":Telescope find_files<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_ff",
  "Find Files"
)
Mapper.map(
  "n",
  "<leader>fb",
  ":Telescope buffers<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_buf",
  "Find Buffers"
)
Mapper.map(
  "n",
  "<leader>g",
  ":Telescope live_grep<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_lgrep",
  "Live Grep"
)
Mapper.map(
  "n",
  "<leader>h",
  ":Telescope command_history<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_chist",
  "Command History"
)
Mapper.map(
  "n",
  "<leader>r",
  ":Telescope registers<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_reg",
  "Registers"
)
Mapper.map(
  "n",
  "<leader>m",
  ":Telescope marks<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_marks",
  "Marks"
)
Mapper.map(
  "n",
  "<C-e>c",
  ":Telescope commands<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_cmds",
  "Commands"
)
Mapper.map(
  "n",
  "<C-e>p",
  ":Telescope projects<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_proj",
  "Projects"
)
Mapper.map(
  "n",
  "<C-e>d",
  ":Telescope dap commands<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_dapcmds",
  "Debugging Commands"
)
Mapper.map(
  "n",
  "<C-e>k",
  ":Telescope keymaps<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_keymaps",
  "Mappings"
)
Mapper.map(
  "n",
  "<leader><leader>z",
  ":Telescope zoxide list<CR>",
  { noremap = true, silent = true },
  "Telescope",
  "tele_z",
  "Zoxide"
)

Mapper.map(
  "n",
  "<F9>",
  ":lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_breakpt",
  "Toggle Breakpoint"
)
Mapper.map(
  "n",
  "<leader>rp",
  ":lua require('dap').repl.open()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_oprepl",
  "Open REPL"
)
Mapper.map(
  "n",
  "<F5>",
  ":lua require('dap').continue()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_cont",
  "Continue"
)
Mapper.map(
  "n",
  "<F10>",
  ":lua require('dap').step_over()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_stepover",
  "Step Over"
)
Mapper.map(
  "n",
  "<F11>",
  ":lua require('dap').step_in()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_stepin",
  "Step Into"
)
Mapper.map(
  "n",
  "<F12>",
  ":lua require('dap').step_out()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_stepout",
  "Step Out"
)
Mapper.map(
  "n",
  "<leader><F9>",
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_conbreakpt",
  "Condition Breakpoint"
)
Mapper.map(
  "n",
  "<F8>",
  ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_fnbreakpt",
  "Function Breakpoint"
)
Mapper.map(
  "n",
  "<F6>",
  ":lua require('dap').pause()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_pause",
  "Pause"
)
Mapper.map(
  "n",
  "<leader><F8>",
  ":lua require('dap').run_to_cursor()<CR>",
  { noremap = true, silent = true },
  "Debugging",
  "dap_runtocurs",
  "Run to Cursor"
)
Mapper.map(
  "n",
  "<leader>b",
  "<Plug>BookmarksListAll",
  { noremap = false, silent = true },
  "Bookmarks",
  "bm_listall",
  "List all bookmarks"
)
Mapper.map(
  "n",
  "<C-e>C",
  ":Cheatsheet<CR>",
  { noremap = true, silent = true },
  "Cheatsheets",
  "cheat_open",
  "Open Cheatsheet"
)
Mapper.map(
  "n",
  "<leader>gb",
  ":Gitsigns toggle_current_line_blame<CR>",
  { noremap = true, silent = true },
  "Git",
  "git_toggle_blame",
  "Toggle Git Blame"
)
Mapper.map("n", "<C-e>v", ":Vista!!<CR>", { noremap = true, silent = true }, "Symbols", "vista_toggle", "Toggle Vista")
Mapper.map(
  "n",
  "<leader><leader>td",
  ":ToggleDiag<CR>",
  { noremap = true, silent = true },
  "Diagnostics",
  "diag_toggle",
  "Toggle Diagnostics"
)
Mapper.map(
  "n",
  "<leader>xx",
  "<cmd>TroubleToggle<cr>",
  { noremap = true, silent = true },
  "Diagnostics",
  "trbl_toggle",
  "Toggle Trouble"
)
Mapper.map(
  "n",
  "<leader>xw",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { noremap = true, silent = true },
  "Diagnostics",
  "trbl__wkspace",
  "Workspace Diagnostics"
)
Mapper.map(
  "n",
  "<leader>xd",
  "<cmd>TroubleToggle document_diagnostics<cr>",
  { noremap = true, silent = true },
  "Diagnostics",
  "trbl_doc",
  "Document Diagnostics"
)
Mapper.map(
  "n",
  "<leader>xq",
  "<cmd>TroubleToggle quickfix<cr>",
  { noremap = true, silent = true },
  "Diagnostics",
  "trbl_qfx",
  "Open Diagnostics in QuickFix"
)
Mapper.map(
  "n",
  "<leader>xl",
  "<cmd>TroubleToggle loclist<cr>",
  { noremap = true, silent = true },
  "Diagnostics",
  "trbl_loc",
  "Open Diagnostics in Location List"
)
Mapper.map(
  "n",
  "<leader>gR",
  "<cmd>TroubleToggle lsp_references<cr>",
  { noremap = true, silent = true },
  "Diagnostics",
  "trbl_ref",
  "Diagnostics References"
)
Mapper.map(
  "n",
  "<C-e>f",
  ":FloatermToggle<CR>",
  { noremap = true, silent = true },
  "Terminal",
  "term_floattoggl",
  "Toggle Floating Terminal"
)

Mapper.map("n", "<leader>;", ":HopWord<CR>", { noremap = true, silent = true }, "Movement", "mv_hopword", "Hop To Word")
Mapper.map("n", "<leader>:", ":HopLine<CR>", { noremap = true, silent = true }, "Movement", "mv_hopline", "Hop To Line")
Mapper.map(
  "n",
  "<leader><leader>n",
  ":BufferLineCycleNext<CR>",
  { noremap = true, silent = true },
  "Buffers",
  "buf_next",
  "Next Buffer"
)
Mapper.map(
  "n",
  "<leader><leader>p",
  ":BufferLineCyclePrev<CR>",
  { noremap = true, silent = true },
  "Buffers",
  "buf_prev",
  "Previous Buffer"
)
Mapper.map(
  "n",
  "<leader><leader>b",
  ":BufferlinePick<CR>",
  { noremap = true, silent = true },
  "Buffers",
  "buf_pik",
  "Pick Buffer"
)

-- local apply_vimspector_opt_keymaps = function()
--   vim.g.vimspector_enable_mappings = "HUMAN"
--   Mapper.map(
--     "n",
--     "<Leader>di",
--     "<Plug>VimspectorBalloonEval",
--     { noremap = false, silent = true },
--     "Debugging",
--     "vimspec_eval",
--     "Vimspector Balloon Evaluation"
--   )
--   Mapper.map(
--     "n",
--     "<Leader>uf",
--     "<Plug>VimspectorUpFrame",
--     { noremap = false, silent = true },
--     "Debugging",
--     "vimspec_upframe",
--     "Vimspector Up Frame"
--   )
--   Mapper.map(
--     "n",
--     "<Leader>df",
--     "<Plug>VimspectorDownFrame",
--     { noremap = false, silent = true },
--     "Debugging",
--     "vimspec_downframe",
--     "Vimspector Down Frame"
--   )
-- end
