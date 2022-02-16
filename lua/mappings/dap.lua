-- Mappings for nvim-dap

local opts = { noremap = true, silent = true }

Mapper.map(
"n",
"<leader>dui",
"<cmd>lua require'dapui'.open()<CR>",
opts,
"Debugging",
"dap_openui",
"Open DAP UI"
)


Mapper.map(
	"v",
	"<C-e>k",
	"<cmd>lua require('dapui').eval()<CR>",
	opts,
	"Debugging",
	"dap_evalv",
	"Evaluate Selection"
)

Mapper.map(
	"n",
	"<C-e>k",
	"<cmd>lua require('dapui').eval()<CR>",
	opts,
	"Debugging",
	"dap_eval",
	"Evaluate Word Under Cursor"
)

Mapper.map(
	"n",
	"<F9>",
	":lua require('dap').toggle_breakpoint()<CR>",
	opts,
	"Debugging",
	"dap_breakpt",
	"Toggle Breakpoint"
)

Mapper.map(
	"n",
	"<leader>rp",
	":lua require('dap').repl.open()<CR>",
	opts,
	"Debugging",
	"dap_oprepl",
	"Open REPL"
)

Mapper.map(
	"n",
	"<F5>",
	":lua require('dap').continue()<CR>",
	opts,
	"Debugging",
	"dap_cont",
	"Continue"
)

Mapper.map(
	"n",
	"<F10>",
	":lua require('dap').step_over()<CR>",
	opts,
	"Debugging",
	"dap_stepover",
	"Step Over"
)

Mapper.map(
	"n",
	"<F11>",
	":lua require('dap').step_into()<CR>",
	opts,
	"Debugging",
	"dap_stepin",
	"Step Into"
)

Mapper.map(
	"n",
	"<F12>",
	":lua require('dap').step_out()<CR>",
	opts,
	"Debugging",
	"dap_stepout",
	"Step Out"
)

Mapper.map(
	"n",
	"<leader><F9>",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts,
	"Debugging",
	"dap_conbreakpt",
	"Condition Breakpoint"
)

Mapper.map(
	"n",
	"<F8>",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts,
	"Debugging",
	"dap_fnbreakpt",
	"Function Breakpoint"
)

Mapper.map(
	"n",
	"<F6>",
	":lua require('dap').pause()<CR>",
	opts,
	"Debugging",
	"dap_pause",
	"Pause"
)

Mapper.map(
	"n",
	"<leader><F8>",
	":lua require('dap').run_to_cursor()<CR>",
	opts,
	"Debugging",
	"dap_runtocurs",
	"Run to Cursor"
)
