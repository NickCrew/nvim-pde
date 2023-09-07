local wk = require("which-key")
wk.register({
  {
    g = {
      name = "+lsp",
      ["["] = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
        "Go To Previous",
      },
      ["]"] = {
        "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
        "Go To Next",
      },
      d = {
        "<cmd>lua vim.lsp.buf.definition()<CR>",
        "Go To Defintion",
      },
      i = {
        "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
        "Incoming Calls",
      },
      o = {
        "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
        "Outgoing Calls",
      },
      x = {},
      p = {
        name = "+preview",
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
      r = {
        "<cmd>lua vim.lsp.buf.references()<CR>",
        "Show References",
      },
      t = {
        "<cmd>lua vim.lsp.buf.type_definition()<CR>",
        "Go To Type Definition",
      },
      w = {
        "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
        "Document Symbol",
      },
      D = {
        "<cmd>lua vim.lsp.buf.declaration()<CR>",
        "Go To Declaration",
      },
      I = {
        "<cmd>lua vim.lsp.buf.implementation()<CR>",
        "Go To Implementation",
      },
      R = {
        "<cmd>lua vim.lsp.buf.rename()<CR>",
        "Rename",
      },
      W = {
        "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
        "Workspace Symbol",
      },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
-- s = {
--     "<cmd>HopChar2AC<cr>",
--     "Hop 2 Char After Cursor"
--   },
--   S = {
--     "<cmd>HopChar2BC<cr>",
--     "Hop 2 Char Before Cursor"
--   },

  }
}, {
  mode = "n"})
