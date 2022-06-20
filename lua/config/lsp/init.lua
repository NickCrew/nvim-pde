-- vim: set foldmethod=marker foldmarker={{{,}}} :
-------------------------------------------------------------------------------
-- Title: LSP Config
-- File: lua/config/lsp/init.lua
-- Description: This module installs and intializes language servers and plugins.
-------------------------------------------------------------------------------

local vim = vim

------[ INITIALIZE DEFAULT CONFIGURATION ] {{{

require("nvim-lsp-installer").setup {}

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach =  require("aerial").on_attach
}

local lspconfig = require("lspconfig")

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)
-- }}}

-----[ SETUP PLUGINS TO EXTEND LSP FUNCTIONALITY ] {{{

require("lsp_signature").setup({
    bind = true,
    handler_opts = { border = "single" },
    fix_pos = true,
    hint_enable = true,
    hint_prefix = "",
    padding = "",
  })

require("toggle_lsp_diagnostics").init({
  start_on = true,
  underline = true,
  signs = true,
  virtual_text = false,
})
-- }}}


-----[ SETUP LANGUAGE SERVER CLIENTS ] {{{
lspconfig.ansiblels.setup({})
lspconfig.cssls.setup({})
lspconfig.diagnosticls.setup({})
lspconfig.dockerls.setup({})
lspconfig.remark_ls.setup({})
lspconfig.jsonls.setup({})
lspconfig.tflint.setup({})
lspconfig.tsserver.setup({})
lspconfig.yamlls.setup({})
-- }}}

-----[ Clients with custom setup configurations ] {{{

-- Lua {{{ 
--
local sumneko_root_path = vim.env.HOME .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary_path = sumneko_root_path .. "/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
        runtime = {
            version = 'LuaJIT',  -- Tell the language server which version of Lua you're using
            path = runtime_path,  -- Setup your lua path
        },
        diagnostics = {
            globals = {'vim'},  -- Get the language server to recognize the `vim` global
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
        },
        telemetry = { -- Do not send telemetry data containing a randomized but unique identifier
            enable = false,
        },
        },
    },
}
-- }}}

-- Pyright {{{
--
lspconfig.pyright.setup({
  python = {
    analysis = {
      typeCheckingMode = "off",
    },
  },
})
-- }}}

-- Rust {{{
--
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
require('rust-tools').setup({
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
})
-- }}}

-- }}}
