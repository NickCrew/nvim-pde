

return {
  -- default
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
  end,
  -- Python
  ["pyright"] = function()
    require("lspconfig").pyright.setup({
      flags = {
        debounce_text_changes = 300
      },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
            typeCheckingMode = "basic",
          },
        },
      },
    })
  end,
  --- lua
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    })
  end,
  -- Ansible
  ["ansiblels"] = function()
    require("lspconfig").ansiblels.setup({
      settings = {
        ansible = {
          path = "/usr/local/Homebrew/ansible",
        },
        ansibleLint = {
          enabled = true,
          path = "/usr/local/Homebrew/ansible-lint"
        },
        python = {
          interpreterPath = "/usr/local/Homebrew/python3"
        },
      },
    })
  end
}
