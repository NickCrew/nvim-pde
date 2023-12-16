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



----------------------------------------
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
map("n", "<A-Down>", "<cmd>resize -3<cr>", opts)
map("n", "<A-Left>", "<cmd>vertical resize -3<cr>", opts)
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
wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
  ["<C-e>"] = { "<Cmd>Telescope buffers<CR>", "Find Buffers" },
  ["<C-p>"] = { "<Cmd>Telescope<CR>", "Find" },
  ["<C-g>"] = {
    name = "+editor",
    a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format Buffer and Save" },
    g = { "<cmd>lua require('edgy').toggle()<cr>", "Toggle Edgy" },
    o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
    t = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
  },
}, {
  mode = "n"
})

-- Normal | Leader
wk.register({
  ["<leader>"] = {
    f = { "<cmd>file<cr>", "File" },
    k = { "<Cmd>WhichKey<Cr>", "WhichKey" },
    o = { "<cmd>Oil<CR>", "Oil" },
  },
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
  n = {
    name = "+notifications",
    n = { "<cmd>Notifications<cr>", "Notifications", },
    e = { "<cmd>NoiceErrors<cr>", "Errors", },
    h = { "<cmd>NoiceHistory<cr>", "History", },
    x = { "<cmd>NoiceDismiss<cr>", "Dismis Notifications", },
  },
  h = {
    name = "+hop",
    c = { "<cmd>HopWordCurrentLine<cr>", "Hop to Word In Current Line" },
    l = { "<cmd>HopLine<cr>", "Hop To Line" },
    s = { "<cmd>HopLineStart<cr>", "Hop To Start of Line" },
  },
  b = {
    name  = "+buffers",
    p     = { "<Cmd>BufferLineTogglePin<CR>", "Toggle pin" },
    b     = { "<Cmd>BufferLinePick<CR>", "Pick Buffer" },
    c     = { "<Cmd>BufferLinePickClose<CR>", "Pick Buffer To Close" },
    P     = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
    o     = { "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers" },
    r     = { "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right" },
    l     = { "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left" },
    ["["] = { "<cmd>BufferLineCyclePrev<cr>", "Prev buffer" },
    ["]"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
  }
}, {
  mode = "n",
  prefix = "<leader>"
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
