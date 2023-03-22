-- vim: set foldmethod=marker foldmarker={{{,}}} :
-------------------------------------------------------------------------------
-- Title: LSP Config
-- File: lua/config/lsp/init.lua
-- Description: This module installs and intializes language servers and plugins.
-------------------------------------------------------------------------------

local vim = vim

------[ DEFINE DIAGNOSTIC SIGNS ] {{{
local fn = vim.fn

-- Diagnostic Signs
for type, icon in pairs({
  Error = " ",
  Warning = " ",
  Warn = " ",
  Hint = " ",
  Information = " ",
  Info = " ",
}) do
  local highlight = "DiagnosticSign" .. type
  fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = "" })
end



-- }}}

------[ INITIALIZE DEFAULT CONFIGURATION ] {{{

require("nvim-lsp-installer").setup {}

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
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
lspconfig.lua_ls.setup({ })
lspconfig.cssls.setup({})
-- lspconfig.diagnosticls.setup({})
--lspconfig.dockerls.setup({})
lspconfig.remark_ls.setup({})
lspconfig.jsonls.setup({})
lspconfig.tflint.setup({})
lspconfig.tsserver.setup({})
-- lspconfig.yamlls.setup({})
lspconfig.vimls.setup({})
-- }}}

-----[ Clients with custom setup configurations ] {{{

-- Lua {{{ 
--

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


-- Ansible {{{
local python_bin_dir = vim.env.HOME .. "/.pyenv/versions/neovim/bin"

lspconfig.ansiblels.setup({
  settings = {
    ansible = {
      path = python_bin_dir .. "ansible"
    },
    ansibleLint = {
      enabled = true,
      path = python_bin_dir .. "ansible-lint"
    },
    python = {
      interpreterPath = python_bin_dir .. "python"
    }
  }
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
