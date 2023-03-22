-- vim: set  foldmarker={{{,}}}
-- WhichKey Configuration
--

local wk = require("which-key")

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
    h = {
      name = "+hop",
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
      a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "View Diagnostic" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      o = { "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "Outgoing Calls", },
      i = { "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls", },
      R = { "<cmd>LspRestart<cr>", "Restart LSP" } 
    },
  }, {
    prefix = "<leader>",
  }
)

-- <SPC><SPC> +K +telescope {{{
wk.register({
  name = "+telescope",
  a = { "<cmd>Telescope aerial<cr>", "Aerial Symbol" },
  b = { "<cmd>Telescope buffers<cr>", "Buffer" },
  c = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
  d = {
    name = "+dap",
    c = { "<cmd>Telescope dap commands<cr>", "DAP Commands" },
    b = { "<cmd>Telescope dap list_breakpoints<cr>", "DAP Breakpoints" },
    v = { "<cmd>Telescope dap variables<cr>", "DAP Variables" },
    f = { "<cmd>Telescope dap frames<cr>", "DAP Frames" },
    C = { "<cmd>Telescope dap configurations<cr>", "DAP Configs" },
  },
  f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
  g = { "<cmd>Telescope live_grep<cr>", "Find String in Files" },
  h = {
    "<cmd>Telescope harpoon marks<cr>", "Find Harpoon Using Telescope"
  },
  k = { "<cmd>Telescope keymaps<cr>", "Find Keymap" },
  l = { "<cmd>Telescope luasnip<cr>", "Find Snippet" },
  m = { "<cmd>Telescope marks<cr>", "Find in Marks" },
  r = { "<cmd>Telescope registers<cr>", "Find in Registers" },
  w = {
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
    "Switch to Git Worktree",
  },
  B = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
  R = { "<cmd>Telescope refactoring<cr>", "Refactoring" },
}, {
  prefix = "<leader><leader>"
})

-- }}}

-- +lsp {{{
wk.register({
  name = "+lsp",
  g = {
    name = "+goto",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Defintion" },
    i = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "Go To Implementation",
    },
    p = {
      name = "+preview",
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
    r = {
      "<cmd>lua vim.lsp.buf.references()<CR>", "Show References"
    },
    t = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Go To Type Definition",
    },
    w = {
      "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
      "Document Symbol",
    },
    W = {
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
      "Workspace Symbol",
    },
    ["["] = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
      "Go To Previous",
    },
    ["]"] = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Go To Next",
    },
    D = {
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      "Go To Declaration",
    },
  },
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
}, {
  mode = "n",
})
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
  name = "+actions",
  a = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
  f = { "<cmd>Fern . -drawer -toggle<cr>", "Toggle File Tree" },
  p = {
    "<cmd>lua require('harpoon.ui').nav_next()<cr>",
    "Next Harpoon Mark",
  },
  p = {
    "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
    "Previous Harpoon Mark",
  },
  u = { "<cmd>MundoToggle<cr>", "Toggle Undo Tree" },
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
  ["<C-a>"] = {
    "<cmd>lua require('harpoon.mark').add_file()<cr>",
    "Add Harpoon Mark",
  },
  ["<C-d>"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Open DAP UI", },
  ["<C-h>"] = {
    "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
    "Harpoon Quick Menu",
  },
}, {
  prefix = "<C-a>",
})
-- }}}

-- CTRL+B +sidebar {{{
wk.register({
  name = "+sidebar",
}, {
  prefix = "<C-e>"
})
-- }}}



-- V:SPC +refactor {{{
wk.register({
  name = "+refactor(v)",
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
  t = {
    name = "+test(v)",
    s = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "Debug Selection" },
  }
}, {
  prefix = "<leader>",
  mode = "v",
})
-- }}}


