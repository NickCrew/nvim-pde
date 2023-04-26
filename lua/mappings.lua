-- Mappings

local vim = vim
local map = vim.api.nvim_set_keymap
local bufmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }
local wk = require("which-key")

function _G.set_terminal_keymaps()
	bufmap(0, "t", "<esc>", [[<C-\><C-n>]], { noremap = true })
	bufmap(0, "t", "jk", [[<C-\><C-n>]], { noremap = true })
	bufmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true })
	bufmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true })
	bufmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true })
	bufmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true })
end

map("", "<Space>", "<Nop>", { noremap = true, silent = true })
map("n", "N", "Nzz", opts)
map("n", "n", "nzz", opts)
map("n", "<M-left>", "<C-w>h<C-w>|", opts)
map("n", "<M-right>", "<C-w>l<C-w>|", opts)
map("n", "<M-down>", "<C-w>j<C-w>_", opts)
map("n", "<M-up>", "<C-w>k<C-w>_", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "q:", "<nop>", opts)
map("n", "Q", "<nop>", opts)

wk.register({
	["["] = {
		"<cmd>bp<cr>",
		"Focus Left Buffer",
	},
	["]"] = {
		"<cmd>bn<cr>",
		"Focus Right Buffer",
	},
	["<tab>"] = {
		"<cmd>b#<CR>",
		"Last Focused Buffer",
	},
	[","] = {
		"<cmd>noh<CR>",
		"Turn off search highlighting",
	},
	[";"] = { "zz", "Center Window" },

	a = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
	b = {
		"<cmd>BufferLinePick<cr>",
		"Pick Buffer",
	},
	d = {
		"<cmd>lua require'dapui'.toggle()<CR>",
		"Open DAP UI",
	},
	f = {
		name = "+files",
		f = {
			"<cmd>Fern . -drawer -toggle<cr>",
			"Toggle File Tree",
		},
	},
	l = {
		name = "+line",
		a = {
			"<cmd>lua vim.lsp.buf.code_action()<CR>",
			"Show Code Actions",
		},
		b = {
			"<cmd>Gitsigns toggle_current_line_blame<cr>",
			"Toggle In-Line Blame Text",
		},
		c = {
			"<cmd>Gitsigns blame_line<cr>",
			"Show commit message in floating window",
		},
		l = {
			"<cmd>HopLine<CR>",
			"Hop To Line",
		},
		h = {
			"<cmd>HopWordCurrentLine<CR>",
			"Hop To Word",
		},
	},
	u = {
		"<cmd>MundoToggle<cr>",
		"Toggle Undo Tree",
	},
	v = {
		v = {
			"<cmd>HopVertical<CR>",
			"Hop Vertical",
		},
		a = {
			"<cmd>HopVerticalAC<CR>",
			"Hop Vertical AC",
		},
		b = {
			"<cmd>HopVerticalBC<CR>",
			"Hop Vertical BC",
		},
	},
	w = {
		"<cmd>WhichKey<cr>",
		"Toggle WhichKey",
	},
	x = {
		name = "+diagnostics",
		d = {
			"<cmd>TroubleToggle document_diagnostics<cr>",
			"Toggle Document Diagnostics",
		},
		w = {
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			"Toggle Workspace Diagnostics",
		},
		x = {
			"<cmd>TroubleToggle<cr>",
			"Toggle All Diagnostics",
		},
	},
	R = { "<cmd>ReloadLuaFile<cr>", "Reload Lua File" },
	U = { "<cmd>lua require('utils').update_theme()<cr>", "Update Theme" },
}, {
	prefix = "<leader>",
})

wk.register({
	name = "+telescope",
	b = { "<cmd>Telescope buffers<cr>", "Buffer" },
	c = {
		"<cmd>Telescope neoclip<cr>",
		"Clipboard",
	},
	d = {
		name = "+dap",
		b = {
			"<cmd>Telescope dap list_breakpoints<cr>",
			"DAP Breakpoints",
		},
		c = {
			"<cmd>Telescope dap commands<cr>",
			"DAP Commands",
		},
		f = {
			"<cmd>Telescope dap frames<cr>",
			"DAP Frames",
		},
		v = {
			"<cmd>Telescope dap variables<cr>",
			"DAP Variables",
		},
		C = {
			"<cmd>Telescope dap configurations<cr>",
			"DAP Configs",
		},
	},
	f = {
		"<cmd>Telescope find_files<cr>",
		"Find File",
	},
	g = {
		"<cmd>Telescope live_grep<cr>",
		"Find String in Files",
	},
	h = {
		"<cmd>Telescope harpoon marks<cr>",
		"Harpoon'd Files",
	},
	k = {
		"<cmd>Telescope keymaps<cr>",
		"Find Keymap",
	},
	l = {
		"<cmd>Telescope luasnip<cr>",
		"Find Snippet",
	},
	m = {
		"<cmd>Telescope marks<cr>",
		"Find in Marks",
	},
	o = {
		"<cmd>Telescope smart_open<cr>",
		"Smart Open",
	},
	r = {
		"<cmd>Telescope registers<cr>",
		"Find in Registers",
	},
	t = {
		"<cmd>Telescope toggleterm<cr>",
		"Find Terminal",
	},
	s = {
		"<cmd>Telescope aerial<cr>",
		"Find Symbols",
	},
	w = {
		"<cmd>ListGitWorktrees<cr>",
		"Git Worktrees",
	},
	B = {
		"<cmd>Telescope file_browser<cr>",
		"Browse Files",
	},
	R = {
		"<cmd>Telescope refactoring<cr>",
		"Refactoring",
	},
}, {
	prefix = "<leader><leader>",
})

wk.register({
	g = {
		name = "+lsp",
		R = {
			"<cmd>lua vim.lsp.buf.rename()<CR>",
			"Rename",
		},
		o = {
			"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
			"Outgoing Calls",
		},
		i = {
			"<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
			"Incoming Calls",
		},
		d = {
			"<cmd>lua vim.lsp.buf.definition()<CR>",
			"Go To Defintion",
		},
		I = {
			"<cmd>lua vim.lsp.buf.implementation()<CR>",
			"Go To Implementation",
		},
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
		W = {
			"<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
			"Workspace Symbol",
		},
		["["] = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
			"Go To Previous",
		},
		["]"] = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Go To Next",
		},
		D = {
			"<cmd>lua vim.lsp.buf.declaration()<CR>",
			"Go To Declaration",
		},
	},
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    F = {
		"<cmd>lua vim.lsp.buf.format()<CR>",
		"Format Buffer",
	},
}, {
	mode = "n",
})

-- Debugging
wk.register({
	["<F3>"] = {
		"<cmd>DapVirtualTextForceRefresh<cr>",
		"Refresh Virtual Text",
	},
	["<F4>"] = {
		"<cmd>lua require('dap').run_last()<cr>",
		"Run Last",
	},
	["<F5>"] = {
		"<cmd>lua require('dap').continue()<cr>",
		"Continue",
	},
	["<F6>"] = {
		"<cmd>lua require('dap').run_to_cursor()<cr>",
		"Run To Cursor",
	},
	["<F7>"] = {
		"<cmd>lua require('dap').pause()<cr>",
		"Pause",
	},
	["<F8>"] = {
		"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
		"Conditional Breakpoint",
	},
	["<F9>"] = {
		"<cmd>lua require('dap').toggle_breakpoint()<cr>",
		"Toggle Breakpoint",
	},
	["<F10>"] = {
		"<cmd>lua require('dap').step_out()<cr>",
		"Step Out",
	},
	["<F11>"] = {
		"<cmd>lua require('dap').step_into()<cr>",
		"Step In",
	},
	["<F12>"] = {
		"<cmd>lua require('dap').step_over()<cr>",
		"Step Over",
	},
}, {
})

wk.register({}, {
	prefix = ";",
})

wk.register({}, {
	prefix = "<localleader>",
})

wk.register({
	name = "+navigation",
	["["] = {
		"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
		"Previous Harpoon Mark",
	},
	["]"] = {
		"<cmd>lua require('harpoon.ui').nav_next()<cr>",
		"Next Harpoon Mark",
	},
	a = {
		"<cmd>lua require('harpoon.mark').add_file()<cr>",
		"Add Harpoon Mark",
	},

	h = {
		"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
		"Harpoon Quick Menu",
	},
	["1"] = {
		"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
		"Harpoon 1",
	},
	["2"] = {
		"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
		"Harpoon 2",
	},
	["3"] = {
		"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
		"Harpoon 3",
	},
	["4"] = {
		"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
		"Harpoon 4",
	},
	j = {
		"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
		"Harpoon 1",
	},
	k = {
		"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
		"Harpoon 2",
	},
	l = {
		"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
		"Harpoon 3",
	},
	[";"] = {
		"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
		"Harpoon 4",
	},
	t = {
		["1"] = {
			"<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
			"Terminal 1",
		},
		["2"] = {
			"<cmd>lua require('harpoon.term').gotoTerminal(2)<cr>",
			"Terminal 2",
		},
		["3"] = {
			"<cmd>lua require('harpoon.term').gotoTerminal(3)<cr>",
			"Terminal 3",
		},
	},
}, {
	prefix = "<C-a>",
})

wk.register({
}, {
  prefix = "<C-e>"
})

-- Visual mode refactor
wk.register({
	name = "+refactor(v)",
	e = {
		" <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
		"Extract Function",
	},
	f = {
		" <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
		"Extract Function To File",
	},
	v = {
		" <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
		"Extract Variable",
	},
	i = {
		" <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
		"Inline Variable",
	},
	t = {
		name = "+test(v)",
		s = {
			"<ESC>:lua require('dap-python').debug_selection()<CR>",
			"Debug Selection",
		},
	},
}, {
	prefix = "<leader>",
	mode = "v",
})
