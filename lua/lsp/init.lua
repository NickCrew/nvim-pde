-- lsp/init.lua
--

local vim = vim
local lspconfig = require('lspconfig')

local signs = require("lsp.icons")
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(
    highlight,
    { text = icon, texthl = highlight, numhl = "" }
  )
end

-- Toggle
require("toggle_lsp_diagnostics").init({
  start_on = true,
  underline = true,
  signs = true,
  virtual_text = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  require("mappings.lsp").load(bufnr)
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

-- currently installed servers
local lsp_installer_servers = require("nvim-lsp-installer.servers")
-- Desired servers
local servers = {
    "ansiblels",
    "cssls",
    "bashls",
    "diagnosticls",
    "dockerls",
    "html",
    "jsonls",
    "remark_ls",
    "sumneko_lua",
    "tflint",
    "tsserver",
    "vimls",
    "yamlls"
}

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(
    server_name
  )
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

lspconfig.pyright.setup({
  capabilities=capabilities,
  on_attach=on_attach,
  settings={
    python = {
    analysis = {
      typeCheckingMode = "off",
    },
  },
}
})


-- Enable rust_analyzer
require('rust-tools').setup()
lspconfig.rust_analyzer.setup({
    capabilities=capabilities,
    on_attach=on_attach,
    -- on_attach is a callback called when the language server attachs to the buffer
    -- on_attach = on_attach,
  tools = {
    autoSetHints = true,
    hover_with_actions = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_suffix = "",
      other_hints_prefix = "",
    },
  },
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
      assist = {
        importEnforceGranularity = true,
        importPrefix = "crate",
      },
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      experimental = {
        procAttrMacros = true,
      },
      inlayHints = {
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
      },
    }
    }
})
