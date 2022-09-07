local wk = require("which-key")

-- Base mappings for most common actions
-- Single  mappings
wk.register(
	{
		["["] = { "<cmd>BufferLineCyclePrev<cr>", "Focus Left Buffer" },
		["]"] = { "<cmd>BufferLineCycleNext<cr>", "Focus Right Buffer" },
        [","] = { "<cmd>noh<CR>", "Turn off search highlighting"},
        ["<tab>"] = {"<cmd>b#<CR>", "Last Focused Buffer"},
		a = {
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			o = {
				"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
				"Outgoing Calls",
			},
			a = {
				"<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
				"Incoming Calls",
			},
			h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
			e = {
				"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
				"Diagnostics for Line",
			},
		},
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
		dut = {
			"<cmd>lua require'dapui'.toggle()<CR>",
			"Open DAP UI",
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
			m = { "<cmd>Telescope marks<cr>", "Find in Marks" },
			r = { "<cmd>Telescope registers<cr>", "Find in Registers" },
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
          "<Cmd>Hop"
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
        mode = "n"
	}
)


