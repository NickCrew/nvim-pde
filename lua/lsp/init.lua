-- lsp/init.lua
--

local vim = vim

local signs = require("lsp.icons")
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

require("toggle_lsp_diagnostics").init()
require("lsp.ui-customization")


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local map_opts = { noremap = true, silent = true }
Map = require('mapstuff')

local on_attach = function(_, bufnr)
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

  -- show type info in virtual text 
  require('virtualtypes').on_attach()
  -- show diagnostics on hover
  vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})')
  -- LSP Signature
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = {
      border = "single",
    },
    fix_pos = true,
    hint_enable = true,
    hint_prefix = "",
    padding = "",
  })
end

-- currently installed servers
local lsp_installer_servers = require("nvim-lsp-installer.servers")

-- Desired servers
local servers = require("lsp.servers")
-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function()
      -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
      -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
      -- function to set up servers, to avoid doing setting up a server twice.
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      server:setup(opts)
    end)
    if not server:is_installed() then
      -- Queue the server to be installed.
      server:install()
    end
  end
end
