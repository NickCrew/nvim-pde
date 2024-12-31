local g = vim.g
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }


-- PATHS
g.nvim_cache        = os.getenv('HOME') .. "/.cache/nvim"
g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'

-- LEADER
g.mapleader         = " "  -- Leader
g.maplocalleader    = "\\"  -- Local Leader


-- TERMINAL
function _G.set_terminal_keymaps()
  bufmap(0, "n", "<C-\\>", "ToggleTerm", opts)
  bufmap(0, "t", "<esc><esc>", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "jk", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "<C-w>h", [[<C-\><C-n><C-W>h]], opts)
  bufmap(0, "t", "<C-w>j", [[<C-\><C-n><C-W>j]], opts)
  bufmap(0, "t", "<C-w>k", [[<C-\><C-n><C-W>k]], opts)
  bufmap(0, "t", "<C-w>l", [[<C-\><C-n><C-W>l]], opts)
end

-- LSP
_G.set_lsp_keymaps = function(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  -- Hover
  bufmap(bufnr, "n", "K",          "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- Definition
  bufmap(bufnr, "n", "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- Type Definition
  bufmap(bufnr, "n", "gT",         "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  -- Declaration
  bufmap(bufnr, "n", "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- Implementation
  bufmap(bufnr, "n", "gi",         "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- References
  bufmap(bufnr, "n", "gr",         "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- Rename
  bufmap(bufnr, "n", "gR",         "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- Incoming calls
  bufmap(bufnr, "n", "gI",         "<cmd>lua vim.lsp.buf.incoming_calls<cr>", opts)
  -- Oytgoing calls
  bufmap(bufnr, "n", "gO",         "<cmd>lua vim.lsp.buf.outgoing_calls<cr>", opts)
  -- Code Actions
  bufmap(bufnr, "n", "ga",         "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- Show diagnostics
  bufmap(bufnr, "n", 'gl',         "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  -- Add workspace folder
  bufmap(bufnr, "n", 'gwa',        "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  -- Remove workspace folder
  bufmap(bufnr, "n", 'gwr',        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  -- LIst workspace folders
  bufmap(bufnr, "n", 'gwl',        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  -- Set loclist
  bufmap(bufnr, "n", 'gq',         "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  -- Format buffer
  bufmap(bufnr, "n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
end


