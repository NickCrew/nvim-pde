local wk = require('which-key')


wk.register({
  b = {
    name = "buffers",
    b = {"<cmd>BufferLinePick<cr>","Pick Buffer"},
    n = {"<cmd>BufferLineCycleNext<cr>", "Next Buffer"},
    p = {"<cmd>BufferLineCyclePrev<cr>", "Previous Buffer"},
    x = {"<cmd>bd!<cr>", "Delete Buffer"}
  },
   f = {
      name = "find", -- optional group name
      b = {"<cmd>Telescope buffers<cr>", "Find Buffer"},
      c = {"<cmd>Telescope neoclip<cr>", "Find Clipboard"},
      d = {"<cmd>Telescope dap<cr>", "Find DAP Command"},
      f = {"<cmd>Telescope find_files<cr>", "Find File"}, -- create a binding with label
      g = {"<cmd>Telescope live_grep<cr>", "Find String In Files"},
      r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false}, -- additional options for creating the keymap
    },
  g = {
    name = "git",
    b = {"<cmd>Gitsigns toggle_current_line_blame<cr>", "Git Blame for Current Line"},
    m = {"<Plug>(git-messenger)", "Git Messages"}
  },
  x = {
    name = "diagnostics",
    x = {"<cmd>TroubleToggle<cr>", "All Diagnostics"},
    d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics"},
    q = {"<cmd>TroubleToggle quickfix<cr>", "Open Diagnostics in QuickFix"},
    r = {"<cmd>TroubleToggle lsp_references<cr>", "Show References"},
  },
  }, { prefix = "<leader>" }
)

wk.register({
  a = {"<cmd>AerialToggle<cr>", "Symbols Tree"},
  c = {"<cmd>CodeActionMenu<cr>", "Code Actions"},
  f = {"<cmd>Fern . -drawer -toggle<cr>", "File Tree"},
  L = {"<cmd>Legendary<cr>", "All Legends"},
  }, { prefix = "<leader><leader>" })

wk.register({
  a = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark"},
  m = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Harpoon Menu"},
  q = {"<cmd>lua require('core.utils').toggle_qf()<cr>", "Toggle QuickFix"},
  o = {"<cmd>lua require('cmp').complete()<cr>", "Invoke Completion"},
  c = {"<cmd>Telescope commands<cr>", "Commands"},
  s = {"<cmd>lua require('spectre').open()<cr>", "Find and Replace"},
  u = {"<cmd>MundoToggle<cr>", "Undo Tree"},
  h = {"<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1"},
  j = {"<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2"},
  k = {"<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3"},
  l = {"<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Harpoon Mark"},
  p = {"<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Harpoon Mark"}

  }, { prefix = "<C-a>" }
)
