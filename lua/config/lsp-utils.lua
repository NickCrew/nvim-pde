-- lua/plugins/config/lsp-utils.lua
--

local vim = vim
local lsp = vim.lsp
local handlers = lsp.handlers

local bufnr = vim.api.nvim_buf_get_number(0)

handlers["textDocument/codeAction"] = function(_, _, actions)
  require("lsputil.codeAction").code_action_handler(nil, actions, nil, nil, nil)
end

handlers["textDocument/references"] = function(_, _, result)
  require("lsputil.locations").references_handler(nil, result, { bufnr = bufnr }, nil)
end

handlers["textDocument/definition"] = function(_, method, result)
  require("lsputil.locations").definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

handlers["textDocument/declaration"] = function(_, method, result)
  require("lsputil.locations").declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

handlers["textDocument/typeDefinition"] = function(_, method, result)
  require("lsputil.locations").typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

handlers["textDocument/implementation"] = function(_, method, result)
  require("lsputil.locations").implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

handlers["textDocument/documentSymbol"] = function(_, _, result, _, bufn)
  require("lsputil.symbols").document_handler(nil, result, { bufnr = bufn }, nil)
end

handlers["textDocument/symbol"] = function(_, _, result, _, bufn)
  require("lsputil.symbols").workspace_handler(nil, result, { bufnr = bufn }, nil)
end
