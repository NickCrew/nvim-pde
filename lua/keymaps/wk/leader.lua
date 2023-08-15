return {
  ["["] = {
    "<cmd>BufferLineCyclePrev<cr>",
    "Focus Left Buffer",
  },
  ["]"] = {
    "<cmd>BufferLineCycleNext<cr>",
    "Focus Right Buffer",
  },
  ["<tab>"] = {
    "<cmd>b#<CR>",
    "Last Focused Buffer",
  },
  [","] = {
    "<cmd>noh<CR>",
    "Turn off search highlighting",
  },
  a = {
    "<cmd>AerialToggle<cr>",
    "Toggle Symbols Tree"
  },
  [";"] = {
    "<cmd>Neotree toggle<cr>",
    "Toggle Neotree"
  },
  p = {
    name = "+pick",
    p = {
      "<cmd>BufferLinePick<cr>",
      "Pick Buffer To View",
    }
  },
  b = {
    name = "+buffers",
    c = {
      "<Cmd>BufferLinePickClose<cr>",
      "Pick Buffer to Close",
    },
    f = {
      "Format Buffer",
      "<cmd>Format<cr>"
    },
    p = {
      "<cmd>BufferLineTogglePin<cr>",
      "Toggle Pinned Buffer",
    },
    x = {
      "<cmd>!bd<cr>",
      "Close Current Buffer"
    },
    X = {
      "<cmd>BufferlineCloseOthers<cr>",
      "Close Other Buffers"
    }
  },
  l = {
    name = "+current_line",
    a = {
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      "Show Code Actions",
    },
    b = {
      "<cmd>Gitsigns toggle_current_line_blame<cr>",
      "Toggle In-Line Blame Text",
    },
    c = {
      "<cmd>Gitsigns blame_line<cr>",
      "Show commit message in floating window",
    },
  },
  o = {
    "o<esc>",
    "Insert Line Below"
  },
  s = {
    name = "+hop",
    a = { 
      "<Cmd>Hop"
    }

  },
  t = {
    "Enable Twilight",
    "<cmd>TwilightEnable<cr>"
  },
  u = {
    "<cmd>MundoToggle<cr>",
    "Toggle Undo Tree",
  },

  x = {
    name = "+diagnostics",
    d = {
      "<cmd>TroubleToggle document_diagnostics<cr>",
      "Toggle Document Diagnostics",
    },
    w = {
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      "Toggle Workspace Diagnostics",
    },
    x = {
      "<cmd>TroubleToggle<cr>",
      "Toggle All Diagnostics",
    },
    c = {
      "<cmd>TroubleClose<CR>",
      "Close Trouble",
    },
  },
  O = {
    "O<esc>",
    "Insert line above"
  },
  R = {
    "<cmd>ReloadLuaFile<cr>",
    "Reload Lua File"
  },
  T = {
    "Disable Twilight",
    "<cmd>TwilightDisable<cr>"
  },
  U = {
    "<cmd>lua require('utils').update_theme()<cr>",
    "Update Theme"
  },
  W = {
    "<cmd>WhichKey<cr>",
    "Toggle WhichKey",
  },
}
