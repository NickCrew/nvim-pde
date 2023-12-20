--[[
  File: after/plugin/mappings.lua

  Contents:
  - Basic Mappings
  - Which-Key Mappings
  - Abbreviations

]]
--

local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

local wk = require("which-key")



----------------------------------------
-- Abbreviations
----------------------------------------
local function mkabr(abr, cmd)
  vim.cmd { cmd = 'cnoreabbrev', args = { abr, cmd } }
end

mkabr("T", "Telescope ")
mkabr("Lr", "Lazy reload ")


----------------------------------------:w
-- Basic Mappings
----------------------------------------

-- Eliminate Dumbness
map("", "<Space>", "<Nop>", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

-- Yank to void buffer
map("n", "<leader><leader>x", '"_x', opts)
map("n", "<leader><leader>y", '"_y', opts)
map("n", "<leader><leader>d", '"_dd', opts)

-- Keep centered
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize window using <ctrl> arrow keys
map("n", "<A-Up>", "<cmd>resize +3<cr>", opts)
map("n", "<A-Right>", "<cmd>vertical resize +3<cr>", opts)

-- Last Buffer
map("n", "<leader><tab>", "<cmd>b#<cr>", opts)

-- Turn off search highlighting
map("n", "<leader>,", "<cmd>noh<cr>", opts)

-- Save
map("n", "<C-s>", "<cmd>w<cr>", opts)

-- Save all
map("n", "<C-s>s", "<cmd>wall<cr>", opts)

-- Save and quit all
map("n", "<C-s>q", "<cmd>wqall<cr>", opts)

-- Quit all without saving
map("n", "<C-s>s", "<cmd>!qall<cr>", opts)


----------------------------------------
-- Which-Key Mappings
----------------------------------------

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
  ["<C-e>"] = { "<Cmd>Telescope buffers<CR>", "Find Buffers" },
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
    C = { "<cmd>Telescope commands", "Find Command" },
    E = { "<cmd>Telescope emoji<cr>", "Find Emoji" },
    F = { "<cmd>Telescope frecency<cr>", "Find Frecent Files" },
    G = { "<cmd>Telescope glyph<cr>", "Find Glyph" },
    H = { "<cmd>Telescope command_history<cr>", "Find Recent Command" },
    T = { "<cmd>Telescope treesitter", "Find Treesitter Symbol" },
    a = { "<cmd>Telescope aerial<cr>", "Find Symbols" },
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
    e = { "<cmd>Telescope file_browser", "Find in File Browser" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Find String in Files" },
    h = { "<cmd>Telescope harpoon marks<cr>", "Find Harpooned Files" },
    j = { "<cmd>Telescope jumplist", "Find in Jumplist" },
    k = { "<cmd>Telescope keymaps", "Find Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Find in Marks" },
    n = { "<cmd>Telescope notify<cr>", "Find Notification" },
    o = { "<cmd>Telescope oldfiles<cr>", "Find Recent Files" },
    r = { "<cmd>Telescope registers<cr>", "Find in Registers" },
    s = { "<cmd>Telescope luasnip<cr>", "Find Snippet" },
    x = { "<cmd>Telescope quickfix", "Send To QuickFix" },
  },
  -- GIT
  g = {
    name = "+git",
    b = {
      name = "+blame",
      c = { "<cmd>Gitsigns blame_line<cr>", "Show Commit Message" },
      l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame Line" },
    },
    d = { "<cmd>Gitsigns diffthis", "Diff This" },
    n = { "<cmd>Gitsigns next_hunk", "Next Hunk" },
    p = { "<cmd>Gitsigns next_hunk", "Previous Hunk" },
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
    h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu" },
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
  ["<C-h>"] = { "<cmd>Spectre<cr>}", "Search and Replace" },
  a         = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
  o         = { "<cmd>SymbolsOutline<cr>", "Toggle Outline" },
  t         = { "<cmd>Neotree toggle<cr>", "Toggle Explorer" },
  s         = { "<cmd>Neotree git_status", "Toggle Status" },
  w         = { "<Cmd>WhichKey<Cr>", "WhichKey" },
}, {
  mode = "n",
  prefix = "<C-g>"
})


----------------------------------------
-- Global
----------------------------------------
function _G.set_terminal_keymaps()
  bufmap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "jk", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end
