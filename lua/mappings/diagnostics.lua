local opts = { noremap = false, silent = true }

-- Open TODOs in QuickFix Window
Mapper.map(
	"n",
	"<leader>2d",
	":TodoQuickFix<CR>",
	opts,
	"Diagnostics",
	"todo_qf",
	"Open TODOs in QuickFix Window"
)
-- Toggle Underline
Mapper.map(
	"n",
	"<leader>tlu",
	"<Plug>(toggle-lsp-diag-underline)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_ul",
	"Toggle Underline"
)
-- Toggle Signs
Mapper.map(
	"n",
	"<leader>tls",
	"<Plug>(toggle-lsp-diag-signs)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_signs",
	"Toggle Signs"
)
-- Toggle Virtual Text
Mapper.map(
	"n",
	"<leader>tlv",
	"<Plug>(toggle-lsp-diag-vtext)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_vtext",
	"Toggle Virtual Text"
)
-- Toggle Update on Insert
Mapper.map(
	"n",
	"<leader>tlp",
	"<Plug>(toggle-lsp-diag-update_in_insert)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_upins",
	"Toggle Update on Insert"
)
-- Toggle Diagnostics
Mapper.map(
	"n",
	"<leader>tld",
	"<Plug>(toggle-lsp-diag)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl",
	"Toggle Diagnostics"
)
-- Set All To Default
Mapper.map(
	"n",
	"<leader>tldd",
	"<Plug>(toggle-lsp-diag-default)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_default",
	"Set All To Default"
)
-- Turn Off
Mapper.map(
	"n",
	"<leader>tldo",
	"<Plug>(toggle-lsp-diag-off)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_off",
	"Turn Off"
)
-- Turn On
Mapper.map(
	"n",
	"<leader>tldf",
	"<Plug>(toggle-lsp-diag-on)",
	{ noremap = false, silent = true },
	"Diagnostics",
	"diag_togl_on",
	"Turn On"
)
-- Toggle Trouble
Mapper.map(
	"n",
	"<leader>xx",
	"<cmd>TroubleToggle<cr>",
	opts,
	"Diagnostics",
	"trbl_toggle",
	"Toggle Trouble"
)
-- Workspace Diagnostics
Mapper.map(
	"n",
	"<leader>xw",
	"<cmd>TroubleToggle workspace_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl__wkspace",
	"Workspace Diagnostics"
)
-- Document Diagnostics
Mapper.map(
	"n",
	"<leader>xd",
	"<cmd>TroubleToggle document_diagnostics<cr>",
	opts,
	"Diagnostics",
	"trbl_doc",
	"Document Diagnostics"
)
-- Open Diagnostics in QuickFix
Mapper.map(
	"n",
	"<leader>xq",
	"<cmd>TroubleToggle quickfix<cr>",
	opts,
	"Diagnostics",
	"trbl_qfx",
	"Open Diagnostics in QuickFix"
)
-- Open Diagnostics in Location List
Mapper.map(
	"n",
	"<leader>xl",
	"<cmd>TroubleToggle loclist<cr>",
	opts,
	"Diagnostics",
	"trbl_loc",
	"Open Diagnostics in Location List"
)
-- Diagnostics References
Mapper.map(
	"n",
	"<leader>gR",
	"<cmd>TroubleToggle lsp_references<cr>",
	opts,
	"Diagnostics",
	"trbl_ref",
	"Diagnostics References"
)
