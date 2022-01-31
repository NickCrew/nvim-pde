local wk = require("which-key")

---
--- Prefix: g
--- Description: LSP related commands
wk.register({
  ["<C-e><C-r>"] = { "<cmd>LspRestart<cr>", "Restart LSP" },
})

wk.register({
  name = "+LSP",
  l = {
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    o = {
      "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
      "Outgoing Calls",
    },
    i = {
      "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
      "Incoming Calls",
    },
    a = { "<cmd>lua vim.diagnostic.open_float()<CR>", "View Diagnostic" },
  },
}, {
  prefix = "<leader>",
})

wk.register({
  name = "+LSP",
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
  g = {
    D = {
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      "Go To Declaration",
    },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Defintion" },
    i = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "Go To Implementation",
    },
    r = { 
      "<cmd>lua vim.lsp.buf.references()<CR>", "Show References" 
    },
    s = {
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      "Signature Help",
    },
    t = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Go To Type Definition",
    },
    W = {
      "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
      "Workspace Symbol",
    },
    w = {
      "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
      "Document Symbol",
    },
    ["]"] = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
      "Go To Previous",
    },
    ["["] = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Go To Next",
    },
  },
}, {
  mode = "n",
})

--
-- Goto Preview
--
wk.register({

  name = "+preview",
  p = {
    c = {
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      "Close All Preview Windows",
    },
    d = {
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      "Preview Definition",
    },
    i = {
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      "Preview Implementation",
    },
    r = {
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      "Preview References",
    },
  },
}, { prefix = "g", mode = "n" })
