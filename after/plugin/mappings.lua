
local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap

local opts = { noremap = true, silent = true }

-- Eliminate Dumbness
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)
-- Keep centered
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)
-- Handy Maximized Window Nav
map("n", "<M-left>", "<C-w>h<C-w>|", opts)
map("n", "<M-right>", "<C-w>l<C-w>|", opts)
map("n", "<M-down>", "<C-w>j<C-w>_", opts)
map("n", "<M-up>", "<C-w>k<C-w>_", opts)
map("n", "-", "<cmd>Oil<cr>", opts)

local wk = require("which-key")
wk.register({
    g = {
      name = "+lsp",
      k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      p = {
        name = "+preview",
        c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All Preview Windows", },
        d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Preview Definition", },
        i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Preview Implementation", },
        r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Preview References", },
      },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show References", },
      d = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go To Type Definition", },
      w = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbol", },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration", },
      I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation", },
      R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename", },
      W = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbol", },
    },
    ["<leader>"] = {
      a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
      f = {
        name = "+telescope",
        a = { "<cmd>Telescope aerial<cr>", "Find Symbols", },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
        f = { "<cmd>Telescope find_files<cr>", "Find File", },
        g = { "<cmd>Telescope live_grep<cr>", "Find String in Files", },
        m = { "<cmd>Telescope marks<cr>", "Find in Marks", },
        r = { "<cmd>Telescope registers<cr>", "Find in Registers", },
        s = { "<cmd>Telescope luasnip<cr>", "Find Snippet", },
      },
      h = {
        name = "+harpoon",
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Harpoon Mark", },
        h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu", },
        H = { "<cmd>Telescope harpoon marks<cr>", "Find Harpooned Files", },
        ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Harpoon 1", },
        ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Harpoon 2", },
        ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Harpoon 3", },
        ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Harpoon 4", },
      },
      l = {
        name = "+line",
        a = { "<cmd>CodeActionMenu<cr>", "Show Code Actions", },
        b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle In-Line Blame Text", },
        c = { "<cmd>Gitsigns blame_line<cr>", "Show commit message in floating window", },
        s = { "<cmd>HopLineStart<cr>", "Hop To Start of Line" },
        l = { "<cmd>HopLine<cr>", "Hop To Line" },
        w = { "<cmd>HopWordCurrentLine<cr>", "Hop to Word In Current Line" },
        o = { "o<esc>", "Insert Line Below" },
        O = { "O<esc>", "Insert line above" },
      },
      t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
      x = {
        name = "+trouble",
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle Document Diagnostics", },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle Workspace Diagnostics", },
        x = { "<cmd>TroubleToggle<cr>", "Toggle All Diagnostics", },
        c = { "<cmd>TroubleClose<CR>", "Close Trouble", },
      },
      R = { "<cmd>ReloadLuaFile<cr>", "Reload Lua File" },
      T = { "<cmd>Telescope<cr>", "Telescope" },
      U = { "<cmd>lua require('utils').update_theme()<cr>", "Update Theme" },
      ["<tab>"] = { "<cmd>b#<CR>", "Last Focused Buffer", },
      [","] = { "<cmd>noh<CR>", "Turn off search highlighting", },
      ["["] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Harpoon Previous", },
      ["]"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Harpoon Next", },
      ["<leader>"] = {},
    },
    ["<C-g>"] = {},
    ["<C-p>"] = {},
    ["<F1>"] = {},
    ["<F2>"] = {},
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
  },
  {
    mode = "n"
  })
  
