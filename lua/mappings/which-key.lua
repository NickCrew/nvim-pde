local wk = require('which-key')


wk.register({
  b = {
    name= "+buffers",
    p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Buffer"}
  },
  x = {
    name = "+diagnostics",
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    x = { "<cmd>TroubleToggle<cr>", "All Diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Open Diagnostics in QuickFix" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "Show References" },
    n = { "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>", "Next Diagnostic Item"},
    p = { "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>", "Previous Diagnostic Item"},
  },
  f = {
    name = "+files", -- optional group name
    b = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    g = { "<cmd>Telescope live_grep<cr>", "Search Files" },
    o = { "<cmd>Telescope oldfiles<cr>", "Find Old File" }, -- additional options for creating the keymap
  },
  p = {
    name = "+paste",
    p = {"<cmd>:"}
  },
  t = {
    name = "telescope",
    e = {"<cmd>Telescope env<cr>", "Environment"},
    p = {"<cmd>Telescope projects<cr>", "Projects"},
    d = {"<cmd>Dash<cr>", "Dash Search"},
    D = {"<cmd>Dash!<cr>", "Dash Search (No keyword)"},
    dw = {"<cmd>DashWord<cr>", "Dash Search Word Under Cursor"},
    dW = {"<cmd>DashWord!<cr>", "Dash Search Word Under Cursor (No keyword)"},
  },
  y = {
    name = "+yank",
    x = { "_dd", "Yank to Void Buffer" },
    y = {'"*y"', "Yank to System Clipboard"},
  },
}, { prefix = "<leader>" }
)

wk.register({
  [";"] = {"<cmd>Legendary<CR>", "Command Palette"},
  ac = { "<cmd>CodeActionMenu<cr>", "Code Actions" },
  H = { "<cmd>Telescope harpoon marks<cr>", "Find Harpoon'd File"},
  aa = {"<cmd>Telescope aerial<cr>", "Document Symbols"},
  hh = { "<cmd>HopWordCurrentLine<CR>", "Hop to Word in Current Line" },
  ll = {"<cmd>HopLine<cr>", "Hop To Line"},
}, {
  prefix = "<leader>"
})

wk.register({
  name = "DAP",
  C = {"<cmd>lua require('dap').continue()<cr>", "Continue"},
  R = {"<cmd>lua require('dap').repl.toggle()<CR>", "Toggle REPL" },
  bp = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint"},
  cbp = {"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional Breakpoint"},
  dd = { "<cmd>Telescope dap commands<cr>", "Find DAP Command" },
  e = {"<cmd>lua require('dap').eval()<cr>", "Evaluate"},
  fbp = {"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Function Breakpoint"},
  p = {"<cmd>lua require('dap').pause()<cr>", "Pause"},
  rc = {"<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor"},
  rl = {"<cmd>lua require('dap').run_last()<cr>", "Run Last"},
  rvt = {"<cmd>DapVirtualTextForceRefresh<cr>", "Refresh Virtual Text"},
  sO = {"<cmd>lua require('dap').step_out()<cr>", "Step Out"},
  si = {"<cmd>lua require('dap').step_into()<cr>", "Step In"},
  so = {"<cmd>lua require('dap').step_over()<cr>", "Step Over"},
  vt = {"<cmd>DapVirtualTextToggle<cr>", "Toggle Virtual Text"},
}, {
  prefix = "\\"
})

wk.register({
  ["<C-a>"] = {
    name = "+workbench",
    ["<C-a>"] = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
    f = { "<cmd>Fern . -drawer -toggle<cr>", "Toggle File Tree" },
    h = {"<C-w>h<C-w>_", "Move and Maximize Window Left"},
    j = {"<C-w>j<C-w>_", "Move and Maximize Window Below"},
    k = {"<C-w>k<C-w>_", "Move and Maximize Window Above"},
    l = {"<C-w>l<C-w>_", "Move and Maximize Window Right"},
    r = { "<cmd>Telescope neoclip<cr>", "Registers" },
    u = { "<cmd>MundoToggle<cr>", "Toggle Undo Tree" },
  },
  ["<C-e>"] = {
    f = { "<cmd>Format<cr>", "Format Buffer" },
    h = { "<cmd>lua require('spectre').open()<cr>", "Find and Replace" },
  },
})

wk.register({
  name = "+git",
  s = {"<cmd>Telescope git_status<cr>", "Git Status"},
  B  = {"<cmd>Telescope git_branches<cr>", "Git Branches"},
  b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame Line" },
},{
prefix = "<leader>g" })


wk.register({
  name = "+nav",
  ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1" },
  ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2" },
  ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3" },
  ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4" },
  ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon 5" },
  ha = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark" },
  J = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Harpoon Mark" },
  F = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Harpoon Mark" },
  f = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
  j = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
  q = { "<cmd>quitall<cr>", "Quit All"},
  Q = {"<cmd>quitall!<cr>", "Quit All (No Save)"}

}, { prefix = "<leader><leader>" })


