
local M = {}

function M.load_goto_mappings()
  local opts = {noremap = true, silent = true}
  -- Preview Definition
  Mapper.map(
      "n",
      "gpd",
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      opts,
      "LSP",
      "lsp_gpreviewdef",
      "Preview Definition"
  )
  -- Preview References
  Mapper.map(
      "n",
      "gpr",
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      opts,
      "LSP",
      "lsp_gpreviewref",
      "Preview References"
  )
  -- Close Preview Windows
  Mapper.map(
      "n",
      "gP",
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      opts,
      "LSP",
      "lsp_gpreviewclose",
      "Close Preview Windows"
  )
  -- Preview Implementation
  Mapper.map(
      "n",
      "gpi",
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      opts,
      "LSP",
      "lsp_gpreviewimp",
      "Preview Implementation"
  )
end

function M.load(bufnr)
	local map_opts = { noremap = true, silent = true }
    -- Go To Declaration
	Mapper.map_buf(
		bufnr,
		"n",
		"gD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		map_opts,
		"LSP",
		"lsp_godecl",
		"Go To Declaration"
	)
    -- Go To Defintion
	Mapper.map_buf(
		bufnr,
		"n",
		"gd",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		map_opts,
		"LSP",
		"lsp_godef",
		"Go To Defintion"
	)
    -- Show References
	Mapper.map_buf(
		bufnr,
		"n",
		"gr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		map_opts,
		"LSP",
		"lsp_showrefs",
		"Show References"
	)
    Mapper.map_buf(
    -- Signature Help
		bufnr,
		"n",
		"gs",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		map_opts,
		"LSP",
		"lsp_sighelp",
		"Signature Help"
	)
    -- Go To Implementation
	Mapper.map_buf(
		bufnr,
		"n",
		"gi",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		map_opts,
		"LSP",
		"lsp_goimpl",
		"Go To Implementation"
	)
    -- Go To Type Definition
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>gt",
		"<cmd>lua vim.lsp.buf.type_definition()<CR>",
		map_opts,
		"LSP",
		"lsp_gotypedef",
		"Go To Type Definition"
	)
    -- Document Symbol
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>gw",
		"<cmd>lua vim.lsp.buf.document_symbol()<CR>",
		map_opts,
		"LSP",
		"lsp_docsym",
		"Document Symbol"
	)
    -- Workspace Symbol
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>gW",
		"<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
		map_opts,
		"LSP",
		"lsp_wksym",
		"Workspace Symbol"
	)
    -- Hover
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>ah",
		"<cmd>lua vim.lsp.buf.hover()<CR>",
		map_opts,
		"LSP",
		"lsp_hover",
		"Hover"
	)
    -- Code Actions
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>ac",
		"<cmd>lua vim.lsp.buf.code_action()<CR>",
		map_opts,
		"LSP",
		"lsp_action",
		"Code Actions"
	)
    -- Rename
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>ar",
		"<cmd>lua vim.lsp.buf.rename()<CR>",
		map_opts,
		"LSP",
		"lsp_ren",
		"Rename"
	)
    -- Quick Fix
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>qf",
		"<cmd>lua vim.lsp.buf.quick_fix(300)<CR>",
		map_opts,
		"LSP",
		"lsp_qikfix",
		"Quick Fix"
	)
    -- Formatting
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>=",
		"<cmd>lua vim.lsp.buf.formatting()<CR>",
		map_opts,
		"LSP",
		"lsp_fmting",
		"Formatting"
	)
    -- Incoming Calls
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>ai",
		"<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
		map_opts,
		"LSP",
		"lsp_incoming",
		"Incoming Calls"
	)
    -- Outgoing Calls
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>ao",
		"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
		map_opts,
		"LSP",
		"lsp_outgoing",
		"Outgoing Calls"
	)
    -- Diagnostics for Line
	Mapper.map_buf(
		bufnr,
		"n",
		"<leader>ee",
		"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
		map_opts,
		"LSP",
		"lsp_lndiag",
		"Diagnostics for Line"
	)
    -- Go To Next
	Mapper.map_buf(
		bufnr,
		"n",
		"[g",
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		map_opts,
		"LSP",
		"lsp_gonext",
		"Go To Next"
	)
    -- Go To Previous
	Mapper.map_buf(
		bufnr,
		"n",
		"]g",
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
		map_opts,
		"LSP",
		"lsp_goprev",
		"Go To Previous"
	)
end

return M
