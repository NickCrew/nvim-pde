local wk = require("which-key")


--
-- F-KEYS
--
wk.register({
  ["<F1>"] = {

  },
  ["<F2>"] = {

  },
  ["<F3>"] = {
    "<cmd>DapVirtualTextForceRefresh<cr>",
    "Refresh Virtual Text"
  },
  ["<F4>"] = {
    "<cmd>lua require('dap').run_last()<cr>",
    "Run Last"
  },
  ["<F5>"] = {
    "<cmd>lua require('dap').continue()<cr>",
    "Continue"
  },
  ["<F6>"] = {
    "<cmd>lua require('dap').run_to_cursor()<cr>",
    "Run To Cursor"
  },
  ["<F7>"] = { "<cmd>lua require('dap').pause()<cr>", "Pause" },
  ["<F8>"] = {
    "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    "Conditional Breakpoint"
  },
  ["<F9>"] = {
    "<cmd>lua require('dap').toggle_breakpoint()<cr>",
    "Toggle Breakpoint"
  },
  ["<F10>"] = {
    "<cmd>lua require('dap').step_out()<cr>",
    "Step Out"
  },
  ["<F12>"] = {
    "<cmd>lua require('dap').step_over()<cr>",
    "Step Over"
  },
  ["<C-F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "Step In"
  },
}, {
  mode = "n"
})

-- No Leader
wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
  ["<C-p>"] = { "<Cmd>Telescope<CR>", "Find" },
  ["<C-g>"] = {}
}, {
  mode = "n"
})

-- Normal | Leader
wk.register({
  b = {
    name = "+buffers",
    c    = {
      name = "+close",
      u    = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
      l    = { "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left" },
      r    = { "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right" },
      o    = { "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers" },
    },
    P    = { "<Cmd>BufferLineTogglePin<CR>", "Toggle pin" },
    b    = { "<Cmd>BufferLinePick<CR>", "Pick Buffer" },
    f    = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format Buffer and Save" },
    p    = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
    n    = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
  },
  f = {
    name = "+find",
    B = { "<cmd>Telescope file_browser<cr>", "Find in File Browser" },
    C = { "<cmd>Telescope commands<cr>", "Find Command" },
    F = { "<cmd>Telescope frecency<cr>", "Find Frecent Files" },
    H = { "<cmd>Telescope command_history<cr>", "Find Recent Command" },
    T = { "<cmd>Telescope treesitter", "Find Treesitter Symbol" },
    a = { "<cmd>Telescope aerial<cr>", "Find Symbols" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    e = { "<cmd>Telescope emoji<cr>", "Find Emoji" },
    g = { "<cmd>Telescope live_grep<cr>", "Find String in Files" },
    h = { "<cmd>Telescope harpoon marks<cr>", "Find Harpooned Files" },
    i = { "<cmd>Telescope glyph<cr>", "Find Icon" },
    j = { "<cmd>Telescope jumplist<cr>", "Find in Jumplist" },
    k = { "<cmd>Telescope keymaps<cr>", "Find Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Find in Marks" },
    n = { "<cmd>Telescope notify<cr>", "Find Notification" },
    o = { "<cmd>Telescope oldfiles<cr>", "Find Recent Files" },
    r = { "<cmd>Telescope registers<cr>", "Find in Registers" },
    s = { "<cmd>Telescope luasnip<cr>", "Find Snippet" },
    x = { "<cmd>Telescope quickfix<cr>", "Send To QuickFix" },
  },
  -- GIT
  g = {
    name = "+git",
    b = {
      name = "+blame",
      c = { "<cmd>Gitsigns blame_line<cr>", "Show Commit Message" },
      l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame Line" },
    },
    d = { "<cmd>Gitsigns diffthis<cr>", "Diff This" },
    n = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
    p = { "<cmd>Gitsigns next_hunk<cr>", "Previous Hunk" },
    s = {
      name = "+stage",
      H = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
      b = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
      h = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
    },
    r = {
      name = "+reset",
      h = { "<cmd>Gitsegns reset_hunk<cr>", "Reset Hunk" },
      b = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
    }
  },
  -- HOP
  l = {
    name = "+current_line",
    c = { "<cmd>HopWordCurrentLine<cr>", "Hop to Word In Current Line" },
    l = { "<cmd>HopLine<cr>", "Hop To Line" },
    s = { "<cmd>HopLineStart<cr>", "Hop To Start of Line" },
  },
  -- NOTIFICATIONS
  n = {
    name = "+notifications",
    n = { "<cmd>Notifications<cr>", "Notifications", },
    e = { "<cmd>NoiceErrors<cr>", "Errors", },
    h = { "<cmd>NoiceHistory<cr>", "History", },
    x = { "<cmd>NoiceDismiss<cr>", "Dismis Notifications", },
  },
  -- TROUBLE
  t = {
    name = "+trouble",
    d = {
      name = "+diagnostics",
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle Document Diagnostics", },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle Workspace Diagnostics", },
    },
    l = {
      name = "+lsp",
      r = { "<cmd>TroubleToggle lsp_references<cr>", "Toggle LSP References", },
      d = { "<cmd>TroubleToggle lsp_definitions<cr>", "Toggle LSP Definitions", },
      i = { "<cmd>TroubleToggle lsp_implementations<cr>", "Toggle LSP Implementations", },
      T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Toggle LSP Type Defintiosn", },
    },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle QuickFix", },
    t = { "<cmd>TroubleToggle<cr>", "Toggle All Diagnostics", },
  },
  ["["] = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
  ["]"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
  -- LEADER (x2)
  ["<leader>"] = {
    name = "+harpoon",

    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon Add File" },
    j = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1 (j)" },
    k = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2 (k)" },
    l = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3 (l)" },
    f = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4 (f)" },
    d = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon 5 (d)" },
    s = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon 6 (s)" },
    ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1" },
    ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2" },
    ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3" },
    ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4" },
    ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon 5" },
    ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Harpoon 6" },
    ["["] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon Previous" },
    ["]"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon Next" },
  },
}, {
  mode = "n",
  prefix = "<leader>"
})

--
-- Ctrl-G
--
wk.register({
  name      = "+quick",
  r         = { "<cmd>Spectre<cr>", "Search and Replace" },
  a         = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
  o         = { "<cmd>SymbolsOutline<cr>", "Toggle Outline" },
  t         = { "<cmd>Neotree toggle<cr>", "Toggle Explorer" },
  s         = { "<cmd>Neotree git_status<cr>", "Toggle Status" },
  w         = { "<Cmd>WhichKey<Cr>", "WhichKey" },
}, {
  mode = "n",
  prefix = "<C-g>"
})


