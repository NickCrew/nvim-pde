-- vim:foldmethod=marker
-- Debug Adapter Protocol

local dap = require("dap")
local dapui = require("dapui")

dap.defaults.fallback.terminal_win_cmd = '10split new'

dap.set_log_level('TRACE')

-- {{{ DAP UI
dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.40, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.20 },
			{ id = "stacks", size = 0.20 },
			{ id = "watches", size = 0.20 },
		},
		size = 45,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = { "repl" },
		size = 20,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

-- Open DAP UI automatically
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- }}}

-- {{{ Virtual Text
require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	-- experimental features:
	virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil,             -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})
-- }}}

-- {{{ Install Adapters and Configurations

-- DAPInstall
local di = require("dap-install")
di.config("jsnode", {})

-- DAP Python Configuration

require("dap-python").setup("~/.pyenv/versions/debugpy/bin/python")
-- table.insert(dap.configurations.python, {
--   {
--     name = "Launch file";
--     type = 'python';
--     request = 'launch';
--     program = "${file}";
--     pythonPath = os.getenv('HOME')..'/.pyenv/shims/python',
--     console = 'integratedTerminal';
--   },
--   {
--     name = "Launch file w/ Input Args";
--     type = 'python';
--     request = 'launch';
--     program = "${file}";
--     pythonPath = os.getenv('HOME')..'/.pyenv/shims/python',
--     console = 'integratedTerminal';
--     args = function()
--       return vim.fn.input('Arguments:')
--     end
--   },
-- })

-- }}}

-- {{{ Signs

-- Customize DAP signs
vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "🟠", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "🔵", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "🔶", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"DapStopped",
	{ text = "🛑", texthl = "", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "⭕", texthl = "", linehl = "", numhl = "" }
)

-- }}}
