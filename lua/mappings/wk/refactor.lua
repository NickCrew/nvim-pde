local wk = require('which-key')
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
	mode = "v",
})
