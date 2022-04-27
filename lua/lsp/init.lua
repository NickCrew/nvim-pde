-- lsp/init.lua
--

local vim = vim

local signs = require('lsp.icons')
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = "" })
end


-- Toggle
require('toggle_lsp_diagnostics').init({
  start_on = true,
  underline = true,
  signs = true,
  virtual_text = false
})



local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  require('mappings.lsp').load(bufnr)
  require('mappings.dap').load(bufnr)
  require('aerial').on_attach(_, bufnr)
  require('lsp_signature').on_attach({
    bind = true,
    handler_opts = { border = "single" },
    fix_pos = true,
    hint_enable = true,
    hint_prefix = "",
    padding = "",
  }, bufnr)
  end

-- currently installed servers
local lsp_installer_servers = require("nvim-lsp-installer.servers")
-- Desired servers
local servers = require('lsp.servers')


-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function()
      -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
      -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
      -- function to set up servers, to avoid doing setting up a server twice.
      if server.name == "sumneko_lua" then
        local luadev = require("lua-dev").setup({})
        server:setup(luadev)
      else
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        server:setup(opts)
      end
    end)
    if not server:is_installed() then
      -- Queue the server to be installed.
      server:install()
    end
  end
end
