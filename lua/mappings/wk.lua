-- vim: set foldmethod=marker foldmarker={{{,}}}
-- WhichKey Configuration
--

local wk = require("which-key")

-- N:SPC {{{
wk.register(
  {
    ["["] = { "<cmd>BufferLineCyclePrev<cr>", "Focus Left Buffer" },
    ["]"] = { "<cmd>BufferLineCycleNext<cr>", "Focus Right Buffer" },
    [","] = { "<cmd>noh<CR>", "Turn off search highlighting" },
    ["<tab>"] = { "<cmd>b#<CR>", "Last Focused Buffer" },
    a = {
      a = {
        "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
        "Incoming Calls",
      },
      e = {
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
        "Diagnostics for Line",
      },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      o = {
        "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
        "Outgoing Calls",
      },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    },
    --
    -- Buffer
    b = {
      name = "+buffers",
      p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
    },
    --
    -- Code
    c = {
      name = "+code",
      a = { "<cmd>CodeActionMenu<cr>", "Code Actions" },
      s = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
    },
    --
    -- Documentation
    d = {
      name = "+docs",
      D = { "<cm>Dash!<cr>", "Dash Search (No keyword)" },
      u = {
        "<cmd>lua require'dapui'.toggle()<CR>",
        "Open DAP UI",
      },
      w = { "<cmd>DashWord<cr>", "Dash Search Word Under Cursor" },
      d = { "<cm>Dash<cr>", "Dash Search" },
      W = {
        "<cmd>DashWord!<cr>",
        "Dash Search Word Under Cursor (No keyword)",
      },
    },
    g = {
      name = "+git",
      b = {
        "<cmd>Gitsigns toggle_current_line_blame<cr>",
        "Toggle Blame Line",
      },
      c = {
        "<cmd>Gitsigns blame_line<cr>",
        "Show commit message in floating window"
      }
    },
    --
    -- Current Line
    l = {
      name = "+line",
      h = {
        "<cmd>HopWordCurrentLine<CR>",
        "Hop to Word in Current Line",
      },
      l = {
        "<cmd>HopLine<CR>",
        "Hop To Line"
      }
    },
    --
    -- Paste
    p = {
      name = "+paste",
    },
    --
    -- Remaps for the refactoring operations currently offered by the plugin
    r = {
      name = "refactoring",
      -- Extract block doesn't need visual mode
      b = {
        " <Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
        "Extract Block",
      },
      f = {
        " <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
        "Extract Block To File",
      },
      -- Inline variable can also pick up the identifier currently under the cursor without visual mode
      i = {
        " <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        "Inline Variable",
      },
      r = {
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        "Telescope Refactoring Menu",
      },
    },
    -- Search
    s = {},
    t = {
      name = "+test",
      n = { "<cmd>lua require('dap-python').test_method()<CR>", "Test Method" },
      f = { "<cmd>lua require('dap-python').test_class()<CR>", "Test Class" },
    },
    --
    -- Diagnostics (Trouble)
    x = {
      name = "+diagnostics",
      d = {
        "<cmd>TroubleToggle document_diagnostics<cr>",
        "Document Diagnostics",
      },
      p = {
        "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
        "Previous Diagnostic Item",
      },
      n = {
        "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
        "Next Diagnostic Item",
      },
      q = {
        "<cmd>TroubleToggle quickfix<cr>",
        "Open Diagnostics in QuickFix",
      },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "Show References" },
      x = { "<cmd>TroubleToggle<cr>", "All Diagnostics" },
    },
    --
    y = {
      name = "+yank",
      x = { "_dd", "Yank to Void Buffer" },
      y = { '"*y"', "Yank to System Clipboard" },
    },
    --
    -- Miscellaneous
    L = {
      name = "+lsp",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      o = {
        "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
        "Outgoing Calls",
      },
      i = {
        "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
        "Incoming Calls",
      },
      a = { "<cmd>lua vim.diagnostic.open_float()<CR>", "View Diagnostic" },
    },
    R = {
      "<Plug>RestNvim", "Run HTTP request",
    }
  },
  -- Options
  {
    prefix = "<leader>",
  }
)
-- }}}


wk.register({
  name = "+test",
  t = {
    s = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "Debug Selection" },
  }
}, {
  prefix = "<leader>",
  mode = "v"
})

-- N +lsp {{{
wk.register({
  name = "+lsp",
  g = {
    D = {
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      "Go To Declaration",
    },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Defintion" },
    i = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "Go To Implementation",
    },
    r = {
      "<cmd>lua vim.lsp.buf.references()<CR>", "Show References"
    },
    s = {
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      "Signature Help",
    },
    t = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Go To Type Definition",
    },
    W = {
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
      "Workspace Symbol",
    },
    w = {
      "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
      "Document Symbol",
    },
    ["]"] = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
      "Go To Previous",
    },
    ["["] = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Go To Next",
    },
  },
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
}, {
  mode = "n",
})
-- }}}

-- N:g +lsp {{{
wk.register({
  name = "+lsp",
  p = {
    c = {
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      "Close All Preview Windows",
    },
    d = {
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      "Preview Definition",
    },
    i = {
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      "Preview Implementation",
    },
    r = {
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      "Preview References",
    },
  },
}, { prefix = "g", mode = "n" })
-- }}}

-- F-Keys +dap {{{
wk.register({
  ["<F3>"] = { "<cmd>DapVirtualTextForceRefresh<cr>", "Refresh Virtual Text" },
  ["<F4>"] = { "<cmd>lua require('dap').run_last()<cr>", "Run Last" },
  ["<F5>"] = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
  ["<F6>"] = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor" },
  ["<F7>"] = { "<cmd>lua require('dap').pause()<cr>", "Pause" },
  ["<F8>"] = {
    "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    "Conditional Breakpoint",
  },
  ["<F9>"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  ["<F10>"] = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
  ["<F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "Step In" },
  ["<F12>"] = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
})
-- }}}

-- CTRL+A +nav {{{
wk.register({
  name = "+nav",
  a = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
  f = { "<cmd>Fern . -drawer -toggle<cr>", "Toggle File Tree" },
  h = {
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
    "Harpoon Quick Menu",
  },
  j = {
    "<cmd>lua require('harpoon.ui').nav_next()<cr>",
    "Next Harpoon Mark",
  },
  k = {
    "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
    "Previous Harpoon Mark",
  },
  m = { "<cmd>Telescope harpoon marks<cr>", "Find Harpoon Marks (Telescope)" },
  t = {
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
    "Switch to Git Worktree",
  },
  ["<C-a>"] = {
    "<cmd>lua require('harpoon.mark').add_file()<cr>",
    "Add Harpoon Mark",
  },
  ["<C-h>"] = {
    "<cmd>Telescope harpoon marks<cr>", "Find Harpoon Using Telescope"
  },
  ["1"] = {
    "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
    "Harpoon Mark 1",
  },
  ["2"] = {
    "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
    "Harpoon Mark 2",
  },
  ["3"] = {
    "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
    "Harpoon Mark 3",
  },
  ["4"] = {
    "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
    "Harpoon Mark 4",
  },
  ["5"] = {
    "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
    "Harpoon Mark 4",
  },
}, {
  prefix = "<C-a>",
})
-- }}}

-- CTRL+K +telescope {{{
wk.register({
  name = "+telescope",
  a = { "<cmd>Telescope aerial<cr>", "Find Aerial Symbol" },
  b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
  c = { "<cmd>Telescope neoclip<cr>", "Find Clipboard" },
  d = { "<cmd>Telescope dap commands<cr>", "Find DAP Command" },
  f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
  g = { "<cmd>Telescope live_grep<cr>", "Find String in Files" },
  k = { "<cmd>Telescope keymaps<cr>", "Find Keymap" },
  l = { "<cmd>Telescope luasnip<cr>", "Find Snippet" },
  m = { "<cmd>Telescope marks<cr>", "Find in Marks" },
  r = { "<cmd>Telescope registers<cr>", "Find in Registers" },
  B = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
  D = { "<cmd>Telescope dap breakpoints<cr>", "Find DAP Breakpoint" },
  R = { "<cmd>Telescope refactoring<cr>", "Refactoring" },
}, {
  prefix = "<leader><leader>"
})

-- }}}

-- V:SPC +refactor {{{
wk.register({
  name = "+refactor",
  e = {
    " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
    "Extract Function",
  },
  f = {
    " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
    "Extract Function To File",
  },
  v = {
    " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
    "Extract Variable",
  },
  i = {
    " <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
    "Inline Variable",
  },
}, {
  prefix = "<leader>",
  mode = "v",
})
-- }}}

-- MISC {{{
wk.register({
  ["<C-e><C-r>"] = { "<cmd>LspRestart<cr>", "Restart LSP" },
})
-- }}}
