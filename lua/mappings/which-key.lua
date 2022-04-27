local wk = require('which-key')


wk.register({
  [";"] = {"<cmd>Legendary<CR>", "Command Palette"},
  d = {
    name = "diagnostics",
    a = { "<cmd>TroubleToggle<cr>", "All Diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Open Diagnostics in QuickFix" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "Show References" },
  },
  f = {
    name = "files", -- optional group name
    b = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    g = { "<cmd>Telescope live_grep<cr>", "Search Files" },
    o = { "<cmd>Telescope oldfiles<cr>", "Find Old File" }, -- additional options for creating the keymap
  },
  b = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
  p = {'"*p', "Paste From System Clipboard"},
  r = { "<cmd>Telescope neoclip<cr>", "Registers" },
  s = { "<cmd>AerialToggle<cr>", "Symbols Tree" },
  xy = { "_dd", "Yank to Void Buffer" },
  y = {'"*y"', "Yank to System Clipboard"},
  S = { "<cmd>Telescope aerial<cr>", "Aerial Symbols" },
}, { prefix = "<leader>" }
)

wk.register({
  ["<C-a>"] = {
    f = { "<cmd>Fern . -drawer -toggle<cr>", "File Tree" },
    s = { "<cmd>lua require('spectre').open()<cr>", "Find and Replace" },
    u = { "<cmd>MundoToggle<cr>", "Undo Tree" },
    ["<C-d>"] = { "<cmd>Telescope dap<cr>", "Find DAP Command" },
  },
  ["<C-e>"] = {
    name = "editing",
    a = { "<cmd>CodeActionMenu<cr>", "Code Actions" },
    b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Git Blame for Current Line" },
    l = { "<cmd>Legendary<cr>", "All Legends" },
    c = { "<cmd>Neogen class<cr>", "Generate Class Docstring"},
    e = { "<cmd>Format<cr>", "Format Buffer" },
    f = { "<cmd>Neogen func<cr>", "Generate Function Docstring"},
  },
})

wk.register({
  name = "navigation",
  ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1" },
  ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2" },
  ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3" },
  ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4" },
  ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Harpoon 5" },
  F = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Harpoon Mark" },
  J = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Harpoon Mark" },
  M = { "<cmd>Telescope harpoon marks<cr>", "Harpoon Marks"},
  a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark" },
  b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
  f = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
  h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Harpoon Menu" },
  j = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
  l = { "<cmd>HopLine<cr>", "Hop To Line"},
  m = { "<cmd>Telescope marks", "Marks"},
  q = { "<cmd>lua require('core.utils').toggle_qf()<cr>", "Toggle QuickFix" },
  w = { "<cmd>HopWordCurrentLine<CR>", "Hop to Word in Current Line" },
  x = { "<cmd>bd!<cr>", "Delete Buffer" },

}, { prefix = "<leader><leader>" })


