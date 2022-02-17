return {
	"kevinhwang91/nvim-hlslens",
	branch = "main",
	keys = {
		{ "n", "*" },
		{ "n", "#" },
		{ "n", "n" },
		{ "n", "N" },
	},
	config = function()
      local vim = vim
		require("hlslens").setup({
			calm_down = true,
			nearest_only = true,
		})
		vim.api.nvim_set_keymap(
			"n",
			"n",
			"<Cmd>execute('normal! ' . v:count1 . 'nzz')<CR><Cmd>lua require('hlslens').start()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"N",
			"<Cmd>execute('normal! ' . v:count1 . 'Nzz')<CR><Cmd>lua require('hlslens').start()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"*",
			"*<Cmd>lua require('hlslens').start()<CR>",
			{ noremap = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"#",
			"#<Cmd>lua require('hlslens').start()<CR>",
			{ noremap = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"g*",
			"g*<Cmd>lua require('hlslens').start()<CR>",
			{ noremap = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"g#",
			"g#<Cmd>lua require('hlslens').start()<CR>",
			{ noremap = true }
		)
	end,
}
