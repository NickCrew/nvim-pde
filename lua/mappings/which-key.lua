local wk = require('which-key')


wk.register({
  b = {
    name= "+buffers",
    p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Buffer"}
  },
  -- d = {
  --   name = "+dash",
  --   d = {"<cmd>Dash<cr>", "Dash Search"},
  --   D = {"<cmd>Dash!<cr>", "Dash Search (No keyword)"},
  --   w = {"<cmd>DashWord<cr>", "Dash Search Word Under Cursor"},
  --   W = {"<cmd>DashWord!<cr>", "Dash Search Word Under Cursor (No keyword)"},
  -- },
  f = {
    name = "+files", -- optional group name
    b = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    g = { "<cmd>Telescope live_grep<cr>", "Search Files" },
    o = { "<cmd>Telescope oldfiles<cr>", "Find Old File" }, -- additional options for creating the keymap
  },
  h = {
    name = "+harpoon",
      h = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu"},
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark" },
  },
  p = {
    name = "+paste",
    p = {"<cmd>:"}
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
  y = {
    name = "+yank",
    x = { "_dd", "Yank to Void Buffer" },
    y = {'"*y"', "Yank to System Clipboard"},
  },
}, { prefix = "<leader>" }
)

wk.register({
  ["["] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
  ["]"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
  ac = { "<cmd>CodeActionMenu<cr>", "Code Actions" },
  gb = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame Line" },
  aa = {"<cmd>Telescope aerial<cr>", "Search Aerial Symbols"},
  lh = { "<cmd>HopWordCurrentLine<CR>", "Hop to Word in Current Line" },
  ll = {"<cmd>HopLine<cr>", "Hop To Line"},
}, {
  prefix = "<leader>"
})

wk.register({
  name = "+debugger",
  C = {"<cmd>lua require('dap').continue()<cr>", "Continue"},
  R = {"<cmd>lua require('dap').repl.toggle()<CR>", "Toggle REPL" },
  bp = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint"},
  cbp = {"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional Breakpoint"},
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
  prefix = "<C-n>"
})

wk.register({
  ["<C-a>"] = {
    name = "+workbench",
      a = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
      p = {"<cmd>Legendary<CR>", "Command Palette"},
      r = { "<cmd>Telescope neoclip<cr>", "Registers" },
      b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
      f = { "<cmd>Fern . -drawer -toggle<cr>", "Toggle File Tree" },
      d = { "<cmd>Telescope dap commands<cr>", "Find DAP Command" },
      u = { "<cmd>MundoToggle<cr>", "Toggle Undo Tree" },
      h = { "<cmd>lua require('spectre').open()<cr>", "Find and Replace" },
  },
  ["<M-j>"] = {"<C-w>j<C-w>_", "Move and Maximize Window Below"},
  ["<M-h>"] = {"<C-w>h<C-w>|", "Move and Maximize Window Left"},
  ["<M-k>"] = {"<C-w>k<C-w>_", "Move and Maximize Window Above"},
  ["<M-l>"] = {"<C-w>l<C-w>|", "Move and Maximize Window Right"},
  ["<M-=>"] = {"<C-w>=", "Restore Window Sizes"},

})

wk.register({
  name = "+nav",
  ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon Mark 1" },
  ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon Mark 2" },
  ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon Mark 3" },
  ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon Mark 4" },
  ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon Mark 5" },
  ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon Mark 6" },
  ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Harpoon Mark 7" },
  ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Harpoon Mark 8" },
  ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Harpoon Mark 9" },
  ["["] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Harpoon Mark" },
  ["]"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Harpoon Mark" },
  q = { "<cmd>quitall<cr>", "Quit All"},
  Q = {"<cmd>quitall!<cr>", "Quit All (No Save)"}
}, { prefix = "<leader><leader>" })


