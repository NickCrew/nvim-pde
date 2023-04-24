-- vim: set  foldmarker={{{,}}}
-- WhichKey Configuration
--

local wk = require("which-key")

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
	b = {
		"<cmd>BufferLinePick<cr>",
		"Pick Buffer",
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
	[";"] = { "zz", "Center WIndow" },
}, {
	prefix = "<leader>",
})

wk.register({}, {
	prefix = "<leader><leader>",
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
	prefix = "<C-t>",
})

wk.register({
	name = "+telescope",
	a = {
		"<cmd>Telescope aerial<cr>",
		"Aerial Symbol",
	},
	b = {
		"<cmd>Telescope buffers<cr>",
		"Buffer",
	},
	c = {
		"<cmd>Telescope neoclip<cr>",
		"Clipboard",
	},
	d = {
		name = "+dap",
		c = {
			"<cmd>Telescope dap commands<cr>",
			"DAP Commands",
		},
		b = {
			"<cmd>Telescope dap list_breakpoints<cr>",
			"DAP Breakpoints",
		},
		v = {
			"<cmd>Telescope dap variables<cr>",
			"DAP Variables",
		},
		f = {
			"<cmd>Telescope dap frames<cr>",
			"DAP Frames",
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
		"Find Harpoon Using Telescope",
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
	w = {
		"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
		"Switch to Git Worktree",
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
})

-- Actions
wk.register({
	name = "+actions",
	a = {
		"<cmd>lua require('harpoon.mark').add_file()<cr>",
		"Add Harpoon Mark",
	},
	b = {
		"<cmd>Fern . -drawer -toggle<cr>",
		"Toggle File Tree",
	},
      d = {
          "<cmd>TroubleToggle document_diagnostics<cr>",
          "Toggle Document Diagnostics",
      },
      w = {
          "<cmd>TroubleToggle workspace_diagnostics<cr>",
          "Toggle Workspace Diagnostics",
      },
	e = {
		"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
		"Harpoon Mark 3",
	},
	f = {
		"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
		"Previous Harpoon Mark",
	},
	h = {
		"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
		"Harpoon Quick Menu",
	},
	j = {
		"<cmd>lua require('harpoon.ui').nav_next()<cr>",
		"Next Harpoon Mark",
	},
	q = {
		"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
		"Harpoon Mark 1",
	},
	r = {
		"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
		"Harpoon Mark 4",
	},
	s = { "<cmd>AerialToggle<cr>", "Toggle Symbols Tree" },
	u = {
		"<cmd>MundoToggle<cr>",
		"Toggle Undo Tree",
	},
	x = {
		"<cmd>TroubleToggle<cr>",
		"Toggle All Diagnostics",
	},
	w = {
		"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
		"Harpoon Mark 2",
	},
	["1"] = {
		"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
		"Harpoon Mark 1",
	},
	["2"] = {
		"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
		"Harpoon Mark 2",
	},
	["3"] = {
		"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
		"Harpoon Mark 3",
	},
	["4"] = {
		"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
		"Harpoon Mark 4",
	},
	["<C-d>"] = {
		"<cmd>lua require'dapui'.toggle()<CR>",
		"Open DAP UI",
	},
}, {
	prefix = "<C-a>",
})

-- Leader2
wk.register({}, {
	prefix = ";",
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
