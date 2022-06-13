-- lsp/init.lua
--
-- This module installs and intializes language servers and plugins.
--

local vim = vim

require("lsp.servers")

local lspconfig = require("lspconfig")

-- make sure all the servers are installed
require("lsp.diagnostics")

-- capabailities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- wanted for install  servers
local on_attach = function(_, bufnr)
  require("lsp.mappings").load(bufnr)
  require("aerial").on_attach(_, bufnr)
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = { border = "single" },
    fix_pos = true,
    hint_enable = true,
    hint_prefix = "",
    padding = "",
  }, bufnr)
end

local opts = { on_attach = on_attach, capabilities = capabilities }

lspconfig.ansiblels.setup(opts)
lspconfig.cssls.setup(opts)
lspconfig.diagnosticls.setup(opts)
lspconfig.dockerls.setup(opts)
lspconfig.remark_ls.setup(opts)
lspconfig.jsonls.setup(opts)
lspconfig.tflint.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.yamlls.setup(opts)
lspconfig.sumneko_lua.setup(require("lua-dev").setup(opts))

-- Pyright Options
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  python = {
    analysis = {
      typeCheckingMode = "off",
    },
  },
})

-- Update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'


-- Normal setup
require('rust-tools').setup({
    -- ... other configs
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
})
