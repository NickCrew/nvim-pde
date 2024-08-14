local bufmap        = vim.api.nvim_buf_set_keymap
local hl            = vim.api.nvim_set_hl
local opts          = { noremap = true, silent = true }
local g             = vim.g

g.nvim_cache        = os.getenv('HOME') .. "/.cache/nvim"
g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/neovim/bin/python'

                        ---------------------------
                        --  Global Key Mappings  -- 
                        ---------------------------

-- Terminal Keymaps
function _G.set_terminal_keymaps()
  bufmap(0, "n", "<C-\\>", "ToggleTerm", opts)
  bufmap(0, "t", "<esc><esc>", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "jk", [[<C-\><C-n>]], opts)
  bufmap(0, "t", "<C-w>h", [[<C-\><C-n><C-W>h]], opts)
  bufmap(0, "t", "<C-w>j", [[<C-\><C-n><C-W>j]], opts)
  bufmap(0, "t", "<C-w>k", [[<C-\><C-n><C-W>k]], opts)
  bufmap(0, "t", "<C-w>l", [[<C-\><C-n><C-W>l]], opts)
end

-- LSP Keymaps
_G.set_lsp_keymaps = function(bufnr)
 -- Enable completion triggered by <c-x><c-o>
   -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
   bufmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   bufmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   bufmap(bufnr, "n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   bufmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   bufmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   bufmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   bufmap(bufnr, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   bufmap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.incoming_calls<cr>", opts)
   bufmap(bufnr, "n", "gO", "<cmd>lua vim.lsp.buf.outgoing_calls<cr>", opts)
   bufmap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
   bufmap(bufnr, "n", 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   bufmap(bufnr, "n", 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   bufmap(bufnr, "n", 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   bufmap(bufnr, "n", 'gwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   bufmap(bufnr, "n", 'gq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

                        ------------------
                        --  Highlights  -- 
                        ------------------

hl(0, "CmpItemKindSupermaven", {fg ="#6CC644"})
