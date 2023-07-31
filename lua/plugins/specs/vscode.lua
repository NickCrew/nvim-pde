return {
{
		-- VS Code remote container support
		"chipsenkbeil/distant.nvim",
		lazy = true,
		enabled = false,
		config = function()
			require("distant").setup()
		end,
	},

	{
		-- Support for VS Code's task.json
		"EthanJWright/vs-tasks.nvim",
		lazy = true,
		enabled = true,
	},

	{
		-- VS Code container development support
		"esensar/nvim-dev-container",
		lazy = true,
		enabled = true,
		config = function()
			require("devcontainer").setup({})
		end,
	},

}
