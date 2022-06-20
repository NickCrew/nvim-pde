local wk = require('which-key')

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
