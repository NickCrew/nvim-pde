local wk = require('which-key')
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
	w = { "<cmd>WhichKey<cr>", "Open WhichKey" },
}, {
	prefix = "<C-a>",
})


