return { 
	["["] = {
		"<cmd>BufferLineCyclePrev<cr>",
		"Focus Left Buffer",
	},
	["]"] = {
		"<cmd>BufferLineCycleNext<cr>",
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
	a = {
      "<cmd>AerialToggle<cr>",
      "Toggle Symbols Tree"
    },
	b = {
		name = "+buffers",
		b = {
			"<cmd>BufferLinePick<cr>",
			"Pick Buffer To View",
		},
		c = {
			"<Cmd>BufferLinePickClose<cr>",
			"Pick Buffer to Close",
		},
        f = {
          "Format Buffer",
          "<cmd>Format<cr>"
        },
		p = {
			"<cmd>BufferLineTogglePin<cr>",
			"Toggle Pinned Buffer",
		},
          x = {
            "<cmd>bdelete<cr>",
            "Close Current Buffer"
          },
          X = {
            "<cmd>BufferlineCloseOthers<cr>",
            "Close Other Buffers"
          }
	},
	s = {
		name = "+sidebar",
		f = {
			"<cmd>Fern . -drawer -toggle<cr>",
			"Toggle File Tree",
		},
	},
	l = {
		name = "+current_line",
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
	},
	h = {
		"<cmd>HopWordCurrentLine<CR>",
		"Hop To Word",
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
	W = {
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
		c = {
			"<cmd>TroubleClose<CR>",
			"Close Trouble",
		},
	},
	D = {
		"<cmd>lua require'dapui'.toggle()<CR>",
		"Open DAP UI",
	},
	R = { "<cmd>ReloadLuaFile<cr>", "Reload Lua File" },
	U = { "<cmd>lua require('utils').update_theme()<cr>", "Update Theme" },
}
