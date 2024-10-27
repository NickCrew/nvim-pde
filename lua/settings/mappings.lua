local bufmap = vim.api.nvim_buf_set_keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Terminal Keymaps
-- LSP Keymaps

-- SANE DEFAULTS
map("", "<Space>", "<Nop>", opts) -- Disable default space
map("n", "q:", "<nop>", opts)     -- Disable command history
map("n", "Q", "<nop>", opts)      -- Disable Ex mode
-- NAVIGATION
map("n", "N", "Nzz", opts)        -- Center cursor on N
map("n", "n", "nzz", opts)        -- Center cursor on n
-- SWITCH WINDOWS AND BUFFERS
map("n", "<A-h>", "<C-w>h", opts)              -- Move to window left
map("n", "<A-j>", "<C-w>j", opts)              -- Move to window down
map("n", "<A-k>", "<C-w>k", opts)              -- Move to window up
map("n", "<A-l>", "<C-w>l", opts)              -- Move to window right
map("n", "<leader><tab>", "<cmd>b#<cr>", opts) -- Go to last buffer
map("n", "<leader>,", "<cmd>noh<cr>", opts)    -- Disable search highlights
-- SAVING AND CLOSING
map("n", "<C-s>", "<cmd>w<cr>", opts)          -- Save
map("n", "<C-s><C-a>", "<cmd>wall<cr>", opts)  -- Save all
map("n", "<C-s><C-s>", "<cmd>wqall<cr>", opts) -- Save all and quit
map("n", "<C-s>a", "<cmd>!qall<cr>", opts)     -- Quit all without saving
-- CLIPBOARD[, YANKING, AND PASTING
map("n", "<leader><leader>x", '"_x', opts)  -- Delete without yanking
map("n", "<leader><leader>d", '"_dd', opts) -- Delete without yanking
map("v", "<leader><leader>y", '"_y', opts)  -- Yank without copying to clipboard
map("v", "<leader>Y", '"*y', opts)          -- Yank to system clipboard
map("n", "<leader>P", '"*p', opts)          -- Paste from system clipboard
-- SESSION MANAGEMENT
map("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})                -- restore the session for the current directory
map("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {}) -- restore the last session
map("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})                -- stop Persistence => session won't be saved on exit
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
  bufmap(bufnr, "n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>", opts) -- Format buffer
  bufmap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts) -- Add workspace folder
  bufmap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts) -- Remove workspace folder
  bufmap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts) -- List workspace folders
end


