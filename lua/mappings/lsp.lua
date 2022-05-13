
local M = {}

local wk = require('which-key')

function M.load(bufnr)

    wk.register({
      ["<C-e><C-r>"] = {"<cmd>LspRestart<cr>", "Restart LSP"}
    },{
      buffer=bufnr
    })
    wk.register({
      name = 'goto',
		D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration"},
		d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Go To Defintion"},
		i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Go To Implementation"},
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Show References" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		t = {"<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go To Type Definition"},
        W = {"<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbol"},
        w = {"<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbol"},
        ["]"]  = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Go To Previous"},
        ["["]  = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Go To Next"},
      },
      {
      prefix = "g",
      buffer = bufnr
    })

    wk.register({
      name = "preview",
        c = {"<cmd>lua require('goto-preview').close_all_win()<CR>", "Close All Preview Windows"},
        d = {"<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Preview Definition"},
        i = {"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Preview Implementation"},
        r = {"<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Preview References" },

    },{
      prefix = "gp",
      buffer = bufnr
    })

    wk.register({
      ar      = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
      ao      = {"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "Outgoing Calls"},
      a       = {"<cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls"},
	  ah      = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
      ee      = {"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Diagnostics for Line"},
    },{
      prefix = "<leader>",
      buffer = bufnr
    })
end

return M
