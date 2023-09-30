local wk = require("which-key")

local M = {}

function M.load_general()
  wk.register({
    a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
    p = {
      name = "+pick",
      p = { "<cmd>BufferLinePick<cr>", "Pick Buffer To View", }
    },
    b = {
      name = "+buffers",
      b = { "<Cmd>BufferLinePick<cr>", "Pick Buffer" },
      c = { "<Cmd>BufferLinePickClose<cr>", "Pick Buffer to Close", },
      f = { "Format Buffer", "<cmd>Format<cr>" },
      p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pinned Buffer", },
      x = { "<cmd>bd!<cr>", "Close Current Buffer" },
      X = { "<cmd>BufferlineCloseOthers<cr>", "Close Other Buffers" }
    },
    l = {
      name = "+current_line",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show Code Actions", },
      b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle In-Line Blame Text", },
      c = { "<cmd>Gitsigns blame_line<cr>", "Show commit message in floating window", },
      l = { "<cmd>HopLine<cr>", "Hop To Line" },
    },
    o = { "o<esc>", "Insert Line Below" },
    s = {
      name = "+hop",
      s = { "<cmd>HopLineStart<cr>", "Hop To Start of Line" },
    },
    t = { "Enable Twilight", "<cmd>TwilightEnable<cr>" },
    u = { "<cmd>MundoToggle<cr>", "Toggle Undo Tree", },
    w = { "<cmd>HopWordCurrentLine<cr>", "Hop to Word In Current Line" },
    x = {
      name = "+diagnostics",
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle Document Diagnostics", },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle Workspace Diagnostics", },
      x = { "<cmd>TroubleToggle<cr>", "Toggle All Diagnostics", },
      c = { "<cmd>TroubleClose<CR>", "Close Trouble", },
    },
    O = { "O<esc>", "Insert line above" },
    R = { "<cmd>ReloadLuaFile<cr>", "Reload Lua File" },
    T = { "Disable Twilight", "<cmd>TwilightDisable<cr>" },
    U = { "<cmd>lua require('utils').update_theme()<cr>", "Update Theme" },
    ["["] = { "<cmd>BufferLineCyclePrev<cr>", "Focus Left Buffer", },
    ["]"] = { "<cmd>BufferLineCycleNext<cr>", "Focus Right Buffer", },
    ["<tab>"] = { "<cmd>b#<CR>", "Last Focused Buffer", },
    [","] = { "<cmd>noh<CR>", "Turn off search highlighting", },
    [";"] = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
  }, {
    prefix = "<leader>",
    mode = "n"
  })
end

function M.load_telescope()
  wk.register({
    {
      name = "+telescope",
      b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
      d = {
        name = "+dap",
        b = { "<cmd>Telescope dap list_breakpoints<cr>", "Find DAP Breakpoints", },
        c = { "<cmd>Telescope dap commands<cr>", "Find DAP Commands", },
        f = { "<cmd>Telescope dap frames<cr>", "Find DAP Frames", },
        v = { "<cmd>Telescope dap variables<cr>", "Find DAP Variables", },
        C = { "<cmd>Telescope dap configurations<cr>", "Find DAP Configs", },
      },
      f = { "<cmd>Telescope find_files<cr>", "Find File", },
      g = { "<cmd>Telescope live_grep<cr>", "Find String in Files", },
      h = { "<cmd>Telescope harpoon marks<cr>", "Find Harpooned Files", },
      j = { "<cmd>Telescope jumplist<cr>", "Find in Jumplist" },
      k = { "<cmd>Telescope keymaps<cr>", "Find Keymap", },
      l = { "<cmd>Telescope luasnip<cr>", "Find Snippet", },
      m = { "<cmd>Telescope marks<cr>", "Find in Marks", },
      o = { "<cmd>Telescope smart_open<cr>", "Smart Open", },
      r = { "<cmd>Telescope registers<cr>", "Find in Registers", },
      t = { "<cmd>Telescope toggleterm<cr>", "Find Terminal", },
      s = { "<cmd>Telescope aerial<cr>", "Find Symbols", },
      w = { "<cmd>ListGitWorktrees<cr>", "Git Worktrees", },
      B = { "<cmd>Telescope file_browser<cr>", "Browse Files", },
      R = { "<cmd>Telescope refactoring<cr>", "Refactoring", },
    }
  }, {
    prefix = "<leader><leader>",
    mode = "n"
  })
end

function M.load_harpoon()
  wk.register({
    {
      name = "+harpoon",
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark", },
      g = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu", },
      h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu", },
      j = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1", },
      k = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2", },
      l = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3", },
      t = {
        ["1"] = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Terminal 1", },
        ["2"] = { "<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>", "Terminal 2", },
        ["3"] = { "<cmd>lua require('harpoon.term').gotoTerminal(3)<cr>", "Terminal 3", },
      },
      ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1", },
      ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2", },
      ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3", },
      ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4", },
      [";"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4", },
    }
  }, {
    model = "n",
    prefix = "<C-g>"
  })
end

function M.load_visual_wk()
  wk.register({
    {
      r = {
        name = "+refactor(v)",
        e = { " <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function", },
        f = { " <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
          "Extract Function To File", },
        v = { " <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable", },
        i = { " <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable", },
      },
      t = {
        name = "+test(v)",
        s = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "Debug Selection", },
      },
    }
  }, {
    mode = "v"
  })
end

function M.load_dap_fkeys()
  require("which-key").register({
      {
        ["<F3>"] = { "<cmd>DapVirtualTextForceRefresh<cr>", "Refresh Virtual Text", },
        ["<F4>"] = { "<cmd>lua require('dap').run_last()<cr>", "Run Last", },
        ["<F5>"] = { "<cmd>lua require('dap').continue()<cr>", "Continue", },
        ["<F6>"] = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor", },
        ["<F7>"] = { "<cmd>lua require('dap').pause()<cr>", "Pause", },
        ["<F8>"] = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
          "Conditional Breakpoint", },
        ["<F9>"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint", },
        ["<F10>"] = { "<cmd>lua require('dap').step_out()<cr>", "Step Out", },
        ["<C-F11>"] = { "<cmd>lua require('dap').step_into()<cr>", "Step In", },
        ["<F12>"] = { "<cmd>lua require('dap').step_over()<cr>", "Step Over", },
      }
    },
    {
      mode = "n"
    }
  )
end

function M.load_dap_whack()
  wk.register({
    {
      R = { "<cmd>DapVirtualTextForceRefresh<cr>", "Refresh Virtual Text", },
      c = { "<cmd>lua require('dap').continue()<cr>", "Continue", },
      r = {
        name = "+run",
        c    = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor", },
        l    = { "<cmd>lua require('dap').run_last()<cr>", "Run Last", },
      },
      p = { "<cmd>lua require('dap').pause()<cr>", "Pause", },
      t = {
        name = "+toggle",
        c = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
          "Conditional Breakpoint", },
        b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint", },
      },
      s = {
        name = "+step",
        o = { "<cmd>lua require('dap').step_out()<cr>", "Step Out", },
        i = { "<cmd>lua require('dap').step_into()<cr>", "Step In", },
        v = { "<cmd>lua require('dap').step_over()<cr>", "Step Over", }
      },
    }
  }, {
    mode = "n",
    prefix = "\\"
  })
end

function M.load_lsp()
  wk.register({
    {
      g = {
        name = "+lsp",
        p = {
          name = "+preview",
          c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All Preview Windows", },
          d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Preview Definition", },
          i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Preview Implementation", },
          r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Preview References", },
        },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show References", },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go To Type Definition", },
        w = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbol", },
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration", },
        I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation", },
        R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename", },
        W = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbol", },
      },
      K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    }
  }, {
    mode = "n" })
end

function M.load_wk()
  M.load_general()
  M.load_telescope()
  M.load_harpoon()
  M.load_visual_wk()
  M.load_dap_whack()
  M.load_lsp()
end

return M
