local M = {}

Map = require('mapstuff')

function M.lsp_buf_maps(bufnr)
  local map_opts = { noremap = true, silent = true }
  Map.map_buf(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", map_opts, "LSP", "lsp_godecl", "Go To Declaration")
  Map.map_buf(bufnr,"n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", map_opts, "LSP", "lsp_godef", "Go To Defintion" )
  Map.map_buf(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", map_opts, "LSP", "lsp_showrefs", "Show References" )
  Map.map_buf(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", map_opts, "LSP", "lsp_sighelp", "Signature Help" )
  Map.map_buf(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", map_opts, "LSP", "lsp_goimpl", "Go To Implementation")
  Map.map_buf(bufnr, "n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition{}<CR>", map_opts, "LSP", "lsp_gotypedef", "Go To Type Definition" )
  Map.map_buf(bufnr, "n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", map_opts, "LSP", "lsp_docsym", "Document Symbol" )
  Map.map_buf(bufnr, "n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", map_opts, "LSP", "lsp_wksym", "Workspace Symbol" )
  Map.map_buf(bufnr, "n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>", map_opts, "LSP", "lsp_hover", "Hover" )
  Map.map_buf(bufnr, "n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", map_opts, "LSP", "lsp_action", "Code Actions" )
  Map.map_buf(bufnr, "n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>", map_opts, "LSP", "lsp_ren", "Rename" )
  Map.map_buf(bufnr, "n", "<leader>qf", "<cmd>lua vim.lsp.buf.quick_fix(300)<CR>", map_opts, "LSP", "lsp_qikfix", "Quick Fix" )
  Map.map_buf(bufnr, "n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", map_opts, "LSP", "lsp_fmting", "Formatting" )
  Map.map_buf(bufnr, "n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", map_opts, "LSP", "lsp_incoming", "Incoming Calls" )
  Map.map_buf(bufnr, "n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", map_opts, "LSP", "lsp_outgoing", "Outgoing Calls" )
  Map.map_buf(bufnr, "n", "<leader>ee", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", map_opts, "LSP", "lsp_lndiag", "Diagnostics for Line" )
  Map.map_buf(bufnr, "n", "[g", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", map_opts, "LSP", "lsp_gonext", "Go To Next" )
  Map.map_buf(bufnr, "n", "]g", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", map_opts, "LSP", "lsp_goprev", "Go To Previous" )
end


return M
