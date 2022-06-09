local wk = require("which-key")

-- Base mappings for most common actions
-- Single leader mappings
wk.register(
	{
		["["] = { "<cmd>BufferLineCyclePrev<cr>", "Focus Left Buffer" },
		["]"] = { "<cmd>BufferLineCycleNext<cr>", "Focus Right Buffer" },
		--
		-- Buffer
		b = {
			name = "+buffers",
			p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
			b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		},
		--
		-- Code
		c = {
			name = "+code",
			a = { "<cmd>CodeActionMenu<cr>", "Code Actions" },
			s = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
		},
		--
		-- Documentation
		d = {
			name = "+docs",
			d = { "<cmd>Dash<cr>", "Dash Search" },
			D = { "<cmd>Dash!<cr>", "Dash Search (No keyword)" },
			w = { "<cmd>DashWord<cr>", "Dash Search Word Under Cursor" },
			W = {
				"<cmd>DashWord!<cr>",
				"Dash Search Word Under Cursor (No keyword)",
			},
		},
		--
		-- Find
		f = {
			name = "+find", -- optional group name
			B = { "<cmd>Telescope file_browser<cr>", "Browse Files" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
			g = { "<cmd>Telescope live_grep<cr>", "Find String in Files" },
			o = { "<cmd>Telescope oldfiles<cr>", "Find Old File" }, -- additional options for creating the keymap
			a = { "<cmd>Telescope aerial<cr>", "Find Aerial Symbol" },
			b = {
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				"Find in Buffer",
			},
            m = { "<cmd>Telescope marks<cr>", "Find in Marks"},
            r = { "<cmd>Telescope registers<cr>", "Find in Registers"}
		},
		g = {
			name = "+git",
			b = {
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				"Toggle Blame Line",
			},
			wt = {
				"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
				"Create Git Worktree",
			},
		},
		--
		-- Harpoon
		h = {
			name = "+harpoon",
			h = {
				"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
				"Harpoon Quick Menu",
			},
			a = {
				"<cmd>lua require('harpoon.mark').add_file()<cr>",
				"Add Harpoon Mark",
			},
		},
		--
		-- Current Line
		l = {
			name = "+line",
			h = {
				"<cmd>HopWordCurrentLine<CR>",
				"Hop to Word in Current Line",
			},
			l = { "<cmd>HopLine<cr>", "Hop To Line" },
		},
		--
		-- Paste
		p = {
			name = "+paste",
			p = { "<cmd>:" },
		},
		--
		-- Remaps for the refactoring operations currently offered by the plugin
		r = {
			name = "Refactoring",
						-- Extract block doesn't need visual mode
			b = {
				" <Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
				"Extract Block",
			},
			bf = {
				" <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
				"Extract Block To File",
			},
			-- Inline variable can also pick up the identifier currently under the cursor without visual mode
			i = {
				" <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
				"Inline Variable",
			},
			r = {
				"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
				"Telescope Refactoring Menu",
			},
		},
		-- Search
		s = {
			name = "+search",
			g = { "<cmd>Telescope live_grep<cr>", "Search Files" },
		},
		--
		-- Diagnostics (Trouble)
		x = {
			name = "+diagnostics",
			d = {
				"<cmd>TroubleToggle document_diagnostics<cr>",
				"Document Diagnostics",
			},
			x = { "<cmd>TroubleToggle<cr>", "All Diagnostics" },
			q = {
				"<cmd>TroubleToggle quickfix<cr>",
				"Open Diagnostics in QuickFix",
			},
			r = { "<cmd>TroubleToggle lsp_references<cr>", "Show References" },
			n = {
				"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>",
				"Next Diagnostic Item",
			},
			p = {
				"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>",
				"Previous Diagnostic Item",
			},
		},
		--
		y = {
			name = "+yank",
			x = { "_dd", "Yank to Void Buffer" },
			y = { '"*y"', "Yank to System Clipboard" },
		},
		--
		-- Miscellaneous
	},
	-- Options
	{
		prefix = "<leader>",
	}
)

wk.register({
  name = "Refactoring Visual",
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

}, { 
  prefix = "<leader>",
  mode = "v"
})

wk.register({
	name = "+harpoon",
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
		"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
		"Harpoon Mark 4",
	},
	["5"] = {
		"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
		"Harpoon Mark 5",
	},
	["6"] = {
		"<cmd>lua require('harpoon.ui').nav_file(6)<cr>",
		"Harpoon Mark 6",
	},
	["7"] = {
		"<cmd>lua require('harpoon.ui').nav_file(7)<cr>",
		"Harpoon Mark 7",
	},
	["8"] = {
		"<cmd>lua require('harpoon.ui').nav_file(8)<cr>",
		"Harpoon Mark 8",
	},
	["9"] = {
		"<cmd>lua require('harpoon.ui').nav_file(9)<cr>",
		"Harpoon Mark 9",
	},
	["j"] = {
		"<cmd>lua require('harpoon.ui').nav_next()<cr>",
		"Next Harpoon Mark",
	},
	["k"] = {
		"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
		"Previous Harpoon Mark",
	},
}, {
	prefix = "<leader><leader>",
})

--
-- Prefix: Ctrl+N
-- Description: Shortcuts to control the debugger (nvim-dap)
wk.register({
	name = "+debugger",
	C = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
	R = { "<cmd>lua require('dap').repl.toggle()<CR>", "Toggle REPL" },
	bp = {
		"<cmd>lua require('dap').toggle_breakpoint()<cr>",
		"Toggle Breakpoint",
	},
	cbp = {
		"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
		"Conditional Breakpoint",
	},
	e = { "<cmd>lua require('dap').eval()<cr>", "Evaluate" },
	fbp = {
		"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
		"Function Breakpoint",
	},
	p = { "<cmd>lua require('dap').pause()<cr>", "Pause" },
	rc = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run To Cursor" },
	rl = { "<cmd>lua require('dap').run_last()<cr>", "Run Last" },
	rvt = { "<cmd>DapVirtualTextForceRefresh<cr>", "Refresh Virtual Text" },
	sO = { "<cmd>lua require('dap').step_out()<cr>", "Step Out" },
	si = { "<cmd>lua require('dap').step_into()<cr>", "Step In" },
	so = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
	vt = { "<cmd>DapVirtualTextToggle<cr>", "Toggle Virtual Text" },
}, {
	prefix = "<C-n>",
})

--
-- Prefix: -
-- Description: Toggle file drawers, sidebars, etc
wk.register({
	name = "+workbench",
	a = { "<cmd>AerialToggle<cr>", "Toggle Aerial" },
	p = { "<cmd>Legendary<CR>", "Command Palette" },
	r = { "<cmd>Telescope neoclip<cr>", "Registers" },
	b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
	f = { "<cmd>Fern . -drawer -toggle<cr>", "Toggle File Tree" },
	d = { "<cmd>Telescope dap commands<cr>", "Find DAP Command" },
	u = { "<cmd>MundoToggle<cr>", "Toggle Undo Tree" },
	h = { "<cmd>lua require('spectre').open()<cr>", "Find and Replace" },
    w = { "<cmd>WhichKey<cr>", "Open WhichKey"}
}, {
	prefix = "<C-a>",
})

--
-- Prefix: None
-- Description: Manage and resize windows
wk.register({
	name = "+windows",
	["<M-j>"] = { "<C-w>j<C-w>_", "Move and Maximize Window Below" },
	["<M-h>"] = { "<C-w>h<C-w>|", "Move and Maximize Window Left" },
	["<M-k>"] = { "<C-w>k<C-w>_", "Move and Maximize Window Above" },
	["<M-l>"] = { "<C-w>l<C-w>|", "Move and Maximize Window Right" },
	["<M-=>"] = { "<C-w>=", "Restore Window Sizes" },
}, {})
